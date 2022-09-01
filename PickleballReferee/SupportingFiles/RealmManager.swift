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
    
    init(name: String) {
        initializeSchema(name: name)
        setupObserver()
    }
    
    func setupObserver() {
        guard let realm = realm else { return }
        let observedMatches = realm.objects(Match.self)
        matchesToken = observedMatches.observe( { [weak self] _ in
            self?.matches = observedMatches
        })
    }
    
    func initializeSchema(name: String) {
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
    
    func addMatch (_ match: Match) {
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
    
    func removeMatch(_ match: Match) {
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

