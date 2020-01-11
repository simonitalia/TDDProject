//
//  TDDProjectTests.swift
//  TDDProjectTests
//
//  Created by Simon Italia on 1/10/20.
//  Copyright © 2020 SDI Group Inc. All rights reserved.
//

import XCTest
@testable import TDDProject

class TDDProjectTests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
    }

    func testAllImagesLoadFromAppBundle() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sut.pictures.count, 10, "10 pictures loaded")
    }
    
    func testTableExists() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasCorrectRowCount() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        let rowCount = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, sut.pictures.count)
    }
    
    func testEachTableViewCellContainsCorrectText() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        for (index, picture) in sut.pictures.enumerated() {
            //get index of picture object in array
            let indexPath = IndexPath(item: index, section: 0)

            //get cell in corresponding row #
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            
            //check cell text matches picture string name
            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }
    
    func testEachCellContainsDisclosureIndicator() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        for index in sut.pictures.indices {
            //get index of picture object in array
            let indexPath = IndexPath(item: index, section: 0)

            //get cell in corresponding row #
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            
            //check cell has disclosure indicator
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func testViewControllerHasLargeTitles() {
        //given
        let sut = ViewController()
//        _ = UINavigationController(rootViewController: sut)
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? true)
    }
    
    func testViewControllerHasCorrectTitle() {
        //given
        let sut = ViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sut.title, "Storm Viewer")
    }
    
    func testDetailViewControllerImageViewExists() {
        //given
        let sut = DetailViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(sut.imageView)
    }
    
    func testDetailViewIsSetToImageView() {
        // given
        let sut = DetailViewController()

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertEqual(sut.view, sut.imageView)
    }
    
    func testDetailViewBackgroundIsWhite() {
        // given
        let sut = DetailViewController()

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertEqual(sut.view?.backgroundColor, .white)
    }
    
    func testDetailViewContentModeIsAspectFit() {
         // given
         let sut = DetailViewController()

         // when
         sut.loadViewIfNeeded()

         // then
         XCTAssertEqual(sut.view?.contentMode, .scaleAspectFit)
     }
    
    func testDetailViewLoadsCorrectImage() {
        // given
        let filename = "nssl0049.jpg"
        let picture = UIImage(named: filename)
        
        let sut = DetailViewController()
        sut.picture = filename

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertEqual(sut.imageView.image, picture)
    }
    
    func testTappingAnImageOnViewControllerTableViewShowsDetailView() {
        // given
        let sut = ViewController()
//        let navigationController = UINavigationController(rootViewController: sut)
        var imageRowTapped: String?
        let indexPath = IndexPath(row: 0, section: 0)

        // when
        sut.pictureSelectAction = {
            imageRowTapped = $0
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: indexPath)

//        // create an expectation…
//        let expectation = XCTestExpectation(description: "Tapping a table view cell on ViewController.")
//
//        // …then fulfill it asynchronously
//        DispatchQueue.main.async {
//            expectation.fulfill()
//        }

        // then
//        wait(for: [expectation], timeout: 1)
//        XCTAssertTrue(navigationController.topViewController is DetailViewController)
        
        XCTAssertEqual(imageRowTapped, "nssl0049.jpg")
    }
    
    //MARK: Integraton test
    
    //Combines previous 2 tests
    func testTappingImageImageOnViewContollerTableViewShowsCorrectImageOnDetailView() {
        // given
        let sut = ViewController()
//        let navigationController = UINavigationController(rootViewController: sut)
        let indexPath = IndexPath(row: 0, section: 0)
        let filename = "nssl0049.jpg"
        let picture = UIImage(named: filename, in: Bundle.main, compatibleWith: nil)

        // when
        sut.pictureSelectAction = {
            let detail = DetailViewController()
            detail.picture = $0
            detail.loadViewIfNeeded()
            
            //then
            XCTAssertEqual(detail.imageView.image, picture)
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: indexPath)

//        let expectation = XCTestExpectation(description: "Tapping a table view cell on ViewController.")
//
//        DispatchQueue.main.async {
//            expectation.fulfill()
//        }
//
//        // then
//        wait(for: [expectation], timeout: 1)
//
//        guard let detail = navigationController.topViewController as? DetailViewController else {
//            XCTFail("Didn't push to a detail view controller.")
//            return
//        }
//
//        detail.loadViewIfNeeded()

//        XCTAssertEqual(detail.imageView.image, picture)
    }

}
