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
        configTopViewConstraints()
        configTableViewContraints()
        configAddTaskButtonConstraints()
        configAddTaskLabelConstraints()
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
    
    private func configTopViewConstraints() {
        self.topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    private func configTableViewContraints() {
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func configAddTaskButtonConstraints() {
        self.addTaskButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    private func configAddTaskLabelConstraints() {
        self.addTaskLabel.snp.makeConstraints { make in
            make.trailing.equalTo(addTaskButton.snp.leading).inset(230)
            make.centerY.equalTo(addTaskButton.snp.centerY)
        }
    }
}
