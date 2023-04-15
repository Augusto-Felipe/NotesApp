//
//  HomeScreen.swift
//  NotesApp
//
//  Created by Felipe Augusto Correia on 13/04/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionAddTaskButtonPressed()
}

class HomeScreen: UIView {
    
    var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appGreenColor
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .white
        tb.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
        return tb
    }()
    
    lazy var addTaskButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.setBackgroundImage(UIImage(systemName: "plus.app"), for: .normal)
        btn.addTarget(self, action: #selector(addTaskButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var addTaskLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont(name: "ChalkboardSE-Bold", size: 17)
        lb.text = "Adicionar uma tarefa"
        lb.textAlignment = .center
        return lb
    }()
    
    public func configTableViewDelegate(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = datasource
    }
    
   @objc private func addTaskButtonPressed() {
       self.delegate?.actionAddTaskButtonPressed()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(topView)
        addSubview(tableView)
        addSubview(addTaskButton)
        addSubview(addTaskLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 200),
            
            tableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addTaskButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            addTaskButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            addTaskButton.heightAnchor.constraint(equalToConstant: 50),
            addTaskButton.widthAnchor.constraint(equalToConstant: 50),
            
            addTaskLabel.trailingAnchor.constraint(equalTo: self.addTaskButton.leadingAnchor, constant: -10),
            addTaskLabel.centerYAnchor.constraint(equalTo: self.addTaskButton.centerYAnchor),
        ])
    }
    
}
