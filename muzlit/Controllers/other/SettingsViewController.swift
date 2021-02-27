//
//  SettingsViewController.swift
//  muzlit
//
//  Created by turbo on 25.02.2021.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    

    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        
        return tableView
    }()
    
    
    private var sections = [Section]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        configureModels()
    }
    
    private  func configureModels() {
        sections.append(Section(title: "Profile", options: [Option(title: "View your profile", handler: { [weak self] in
            DispatchQueue.main.async {
                self?.viewProfile()
            }
        })]))
        sections.append(Section(title: "Account", options: [Option(title: "Sign out", handler: { [weak self] in
            DispatchQueue.main.async {
                self?.SignOutTaped()
            }
        })]))
        
    }
    
    private func SignOutTaped() {
        
        
        
    }
    
    
    
    private func viewProfile() {
        let vc = ProfileViewController()
        vc.title = "Profile"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
        
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].options[indexPath.row]
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.title
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = sections[indexPath.section].options[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       let model = sections[section]
       
        return model.title
        
    }
    
    
    

}
