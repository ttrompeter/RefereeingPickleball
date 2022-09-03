//
//  RealmManager.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 8/30/22.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    
    private(set) var realm: Realm?
    @Published var matches: Results<Match>?
    var matchesArray: [Match] {
        if let matches = matches {
            // Convert Results to an array
            return Array(matches)
        } else {
            return []
        }
    }
    @Published var searchFilter = ""
    var searchResults: [Match] {
        if searchFilter.isEmpty {
            return matchesArray
        } else {
            return matchesArray.filter { $0.eventTitle.lowercased().contains(searchFilter.lowercased()) }
        }
    }
    
    
    private var matchesToken: NotificationToken?
    
    init() {
        initializeSchema()
        setupObserver()
    }
    
    func setupObserver() {
        guard let realm = realm else { return }
        let observedMatches = realm.objects(Match.self)
        matchesToken = observedMatches.observe( { [weak self] _ in
            self?.matches = observedMatches
        })
    }
    
    func initializeSchema() {
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let realmFileUrl = docDir.appendingPathComponent("pickleball.realm")
        
        let config = Realm.Configuration(fileURL: realmFileUrl, schemaVersion: 1) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: Match.className()) { _, newObject in
                    //newObject!["ballType"] = "Dura Fast 40"
                }
            }
        }
        Realm.Configuration.defaultConfiguration = config
        // Print path so can look at database
        print(docDir.path)
      
        do {
            realm = try Realm()
        } catch {
            print("Error opening default realm: ", error.localizedDescription)
        }
    }
    
    func saveArchivedMatch (_ archivedMatch: ArchivedMatch) {
        //Check that realm is instantiated
        if let realm = realm {
            do {
                try realm.write {
                    realm.add(archivedMatch)
                }
            } catch {
                print("Error adding ArchivedMatch in Realm Manager")
            }
        }
    }
    
    func saveMatch (_ match: Match) {
        //Check that realm is instantiated
        if let realm = realm {
            do {
                try realm.write {
                    realm.add(match)
                }
            } catch {
                print("Error adding Match in Realm Manager")
            }
        }
    }
    
    func createNewMatch () {
        if let realm = realm {
            let newMatch = Match()
            newMatch.eventTitle = "Realm Manager Match"
            let game1 = Game()
            game1.gameNumber = 1
            newMatch.games.append(game1)
            let game2 = Game()
            game2.gameNumber = 2
            newMatch.games.append(game2)
            let game3 = Game()
            game3.gameNumber = 3
            newMatch.games.append(game3)
            let game4 = Game()
            game4.gameNumber = 4
            newMatch.games.append(game4)
            let game5 = Game()
            game5.gameNumber = 5
            newMatch.games.append(game5)
            do {
                try realm.write {
                    realm.add(newMatch)
                }
            } catch {
                print("Error adding Match in Realm Manager")
            }
        }
    }
    
    func removeArchivedMatch(_ archivedMatch: ArchivedMatch) {
        if let realm = realm {
            if let matchToDelete = realm.object(ofType: Match.self, forPrimaryKey: archivedMatch.id) {
                do {
                    try realm.write {
                        realm.delete(matchToDelete)
                    }
                } catch {
                    print("Error deleting Match in Realm Manager")
                }
            }
        }
    }
    
    func removeMatch(_ match: Match) {
        print("Starting removeMatch()")
        if let realm = realm {
            if let matchToDelete = realm.object(ofType: Match.self, forPrimaryKey: match.id) {
                do {
                    try realm.write {
                        realm.delete(matchToDelete.games)
                        realm.delete(matchToDelete)
                    }
                } catch {
                    print("Error deleting Match in Realm Manager")
                }
            }
        }
    }
    
    func deleteGames(for match: Match) {
        print("Starting deleteGames()")
        if let realm = realm {
                do {
                    try realm.write {
                        realm.delete(match.games)
                    }
                } catch {
                    print("Error deleting games in Realm Manager")
                }
        }
    }
    
    
}

