//
//  ViewController.swift
//  SwiftAllConcepts
//
//  Created by Apple on 11/06/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var viewModel = ViewModel()
    @IBOutlet var tableView: UITableView!
    var array = [JsonPlaceHolder]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getData()
        
    }
    
    func getData() {
        viewModel.getHomeDataWithDispatchGroup{[weak self] jsonData in
            guard let self = self else {return}
            array = jsonData
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Allocates a Table View Cell
        let aCell =
        self.tableView.dequeueReusableCell(withIdentifier: "cell",
                                           for: indexPath)
        // Sets the text of the Label in the Table View Cell
        aCell.textLabel?.text = array[indexPath.row].email
        return aCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

}

