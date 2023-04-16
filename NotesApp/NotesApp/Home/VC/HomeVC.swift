//
//  HomeVC.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 13/04/23.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    var noteUserDefatuls: NoteUserDefaults = NoteUserDefaults()
    
    var noteList: [String] = []
    
    var auth: Auth?

    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.homeScreen?.greetingLabel.text = "Olá, \(auth?.currentUser?.displayName ?? "")"
        self.homeScreen?.delegate(delegate: self)
        self.homeScreen?.configTableViewDelegate(delegate: self, datasource: self)
    }
    
    public func reloadData() {
        noteList = noteUserDefatuls.listNotes()
        self.homeScreen?.tableView.reloadData()
    }
    

}

extension HomeVC: HomeScreenProtocol {
    
    func actionAddTaskButtonPressed() {
        let vc = NoteVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteTableViewCell? = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell
        cell?.setupCell(note: noteList[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            noteUserDefatuls.removeNote(index: indexPath.row)
            reloadData()
        }
    }
}
