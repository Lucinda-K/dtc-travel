//
//  TripBoardViewController.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 7/30/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit
import MobileCoreServices

class TripBoardViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addEntryButton: UIButton!
    
    // IBActions
    @IBAction func addTapped(_ sender: Any) {
        self.presentEntryOptionsPopover()
    }
    
    // Class attributes
    final fileprivate let reuseId = "categoryCell"
    var foodEntries:[Entry] = []
    var peopleEntries:[Entry] = []
    var buildingEntries:[Entry] = []
    private var entryPopover:EntryOptionsPopoverViewController?
    private var textEntry:String = "Dignissim lorem at erat dignissim, vel auctor ex interdum. Nulla facilisi. Nulla a ipsum a lacus molestie consequat a ac ex. Cras auctor ex dapibus orci fermentum, in rutrum neque viverra. Mauris mattis nisl in tortor porta, at dignissim velit bibendum. Integer turpis sem, commodo eget quam non, ultrices cursus lacus. Proin fermentum enim in risus placerat, a elementum nunc commodo. Curabitur a aliquam elit, in tempus sem. Proin commodo eros eu arcu aliquam, in aliquam sapien convallis. Fusce elementum leo enim, eget mattis felis ornare quis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec elementum tellus non lacus convallis, et gravida tellus fringilla."
    
    var capturedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: reuseId)
        // Do any additional setup after loading the view.
        
        // Populate foodEntries
        foodEntries.append(Entry(type: "image", title: "food1", imageString: "food1.jpg", textEntry: nil, category: "Food"))
        foodEntries.append(Entry(type: "audio", title: "food2", imageString: "speaker.png", textEntry: nil, category: "Food"))
        foodEntries.append(Entry(type: "text", title: "food3", imageString: "writing3.png", textEntry: textEntry, category: "Food"))
        foodEntries.append(Entry(type: "image", title: "food4", imageString: "food2.jpg", textEntry: "image", category: "Food"))
        foodEntries.append(Entry(type: "image", title: "food5", imageString: "food3.jpeg", textEntry: "image", category: "Food"))
        
        // Populate peopleEntries
        peopleEntries.append(Entry(type: "audio", title: "people1", imageString: "speaker.png", textEntry: nil, category: "People"))
        peopleEntries.append(Entry(type: "image", title: "people2", imageString: "people1.jpg", textEntry: nil, category: "People"))
        peopleEntries.append(Entry(type: "image", title: "people3", imageString: "people2.png", textEntry: nil, category: "People"))
        peopleEntries.append(Entry(type: "text", title: "people5", imageString: "writing1.png", textEntry: textEntry, category: "People"))
        
        // Populate buildingEntries
        buildingEntries.append(Entry(type: "text", title: "buildings1", imageString: "writing1.png", textEntry: textEntry, category: "Buildings"))
        buildingEntries.append(Entry(type: "audio", title: "buildings2", imageString: "speaker.png", textEntry: nil, category: "Buildings"))
        buildingEntries.append(Entry(type: "text", title: "buildings3", imageString: "writing2.png", textEntry: textEntry, category: "Buildings"))
        buildingEntries.append(Entry(type: "image", title: "buildings4", imageString: "buildings1.jpg", textEntry: nil, category: "Buildings"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentCameraEntry" {
            self.navigationController?.popViewController(animated: true)
        }
        if segue.identifier == "usePhoto" {
            let destination = segue.destination as! CaptionMediaViewController
            destination.capturedImage = self.capturedImage
        }
    }
    
    // Popover Functionality
    private func presentEntryOptionsPopover () {
        guard let entryOptionsPopover = self.storyboard?.instantiateViewController(withIdentifier: "entryOptionsPopover") as? EntryOptionsPopoverViewController else {
            preconditionFailure("EntryOptionsPopover cannot be instantiated from storyboard")
        }
        
        self.entryPopover = entryOptionsPopover
        entryOptionsPopover.delegate = self
        let navigationController = UINavigationController(rootViewController: entryOptionsPopover)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.popover
        navigationController.isNavigationBarHidden = true
        entryOptionsPopover.preferredContentSize = CGSize(width: 300, height: 150)
        
        guard let popover = navigationController.popoverPresentationController else {
            preconditionFailure("Unable to access popoverPresentationControlller for presentation of EntryOptionsPopover")
        }
        popover.delegate = self
        popover.sourceView = self.addEntryButton
        popover.sourceRect = self.addEntryButton.bounds
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func presentCamera () {
        self.entryPopover?.dismiss(animated: false, completion: {
            self.showCamera()
        })
    }
    
    // Use photo from image picker
    func captionCapturedImage(capturedImage: UIImage) {
        self.capturedImage = capturedImage;
        
    }
    
    func presentCaptionView(capturedImage: UIImage) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "captionView") as? CaptionMediaViewController {
            controller.capturedImage = capturedImage
            self.dismiss(animated: true, completion: nil)
            self.present(controller, animated: true, completion: nil)
        }
    }
}

extension TripBoardViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rect = self.tableView.bounds
        
        var numCells = CGFloat(0)
        switch indexPath.section {
        case 0:
            numCells = CGFloat(self.foodEntries.count)
        case 1:
            numCells = CGFloat(self.peopleEntries.count)
        case 2:
            numCells = CGFloat(self.buildingEntries.count)
        default:
            break
        }
        
        let numOfRows = (numCells * 100 / rect.width).rounded()
        return CGFloat(numOfRows * 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "FOOD"
        case 1:
            return "PEOPLE"
        case 2:
            return "BUILDINGS"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? CategoryTableViewCell else {
            preconditionFailure("Cell cannot be dequeued as a CategoryTableViewCell")
        }
        
        switch indexPath.section {
        case 0:
            cell.configure(entries: self.foodEntries, delegate: self)
        case 1:
            cell.configure(entries: self.peopleEntries, delegate: self)
        case 2:
            cell.configure(entries: self.buildingEntries, delegate: self)
        default:
            break
        }
        return cell
    }
}

extension TripBoardViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showCamera() {
        // Make sure device has a camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // Setup and present default Camera View Controller
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
        
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Dismiss the view controller a
        picker.dismiss(animated: true, completion: nil)
        
        
        
        // Get the picture we took
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage ?? UIImage(named: "food3.jpeg")
        
        
        self.presentCaptionView(capturedImage: image!)
    }
}

// Entry Creation
extension TripBoardViewController {
    func presentAudio() {
        let storyboard = UIStoryboard(name: "AudioEntry", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "audioEntry") as? RecordAudioViewController {
            self.dismiss(animated: true, completion: nil)
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func presentText() {
        let storyboard = UIStoryboard(name: "TextEntry", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "textEntry")
        self.dismiss(animated: true, completion: nil)
        self.present(controller, animated: true, completion: nil)
    }
}

// Entry Detail
extension TripBoardViewController {
    func presentTextEntry (entry:Entry) {
        let storyboard = UIStoryboard(name: "TextEntryDetail", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "textEntryDetail") as? TextEntryDetailViewController {
            self.present(controller, animated: true, completion: nil)
            controller.configure(entryModel: entry)
        }
    }
    
    func presentImageEntry (entry:Entry) {
        let storyboard = UIStoryboard(name: "ImageAudioEntryDetail", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "imageAudioEntryDetail") as? ImageAudioEntryDetailViewController {
            self.present(controller, animated: true, completion: nil)
            controller.configure(entry: entry)
        }
    }
}
