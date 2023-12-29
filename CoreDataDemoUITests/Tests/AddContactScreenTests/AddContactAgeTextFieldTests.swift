//
//  AddContactAgeTextFieldTests.swift
//  CoreDataDemoUITests
//
//  Created by Michał Terlicki on 07/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.

//

import XCTest

class AddContactAgeTextFieldTests: BaseTest {

    func testTypingCharactersShowsError() throws {
        let age = "abcd12345"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .ageErrorLabelValueEqualsTo("Age must contain only digits")
    }

    func testTypingSpecialCharactersShowsError() throws {
        let age = "!@#$%^&*()-+=-[]\\;',./{}|:<>?"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .ageErrorLabelValueEqualsTo("Age must contain only digits")
    }

    func testTypingToHighNumerShowsError() throws {
        let age = "100"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .ageErrorLabelValueEqualsTo("Age must be between 0 and 99")
    }

    func testEmptyValueShowsError() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .ageErrorLabelValueEqualsTo("Age is required")
    }

    func testIncrementButtonIncreasesAgeValue() throws {
        let expectedAge = "19"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapIncreaseAge()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testDecrementButtonDecreasesAgeValue() throws {
        let expectedAge = "17"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapDecreaseAge()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testMultipleIncreasingAgeChangesAgeValue() throws {
        let expectedAge = "22"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapIncreaseAge()
            .tapIncreaseAge()
            .tapIncreaseAge()
            .tapIncreaseAge()
            .tapAgeTextField()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testMultipleDecreasingAgeChangesAgeValue() throws {
        let expectedAge = "14"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapDecreaseAge()
            .tapDecreaseAge()
            .tapDecreaseAge()
            .tapDecreaseAge()
            .tapAgeTextField()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testIncreasingAndDecreasingAgeChangesValue() throws {
        let expectedAge = "18"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapIncreaseAge()
            .tapDecreaseAge()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testDecreasingAndIncreasingAgeChangesValue() throws {
        let expectedAge = "18"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapDecreaseAge()
            .tapIncreaseAge()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testTypingAgeFormKeyboardAndIncreasingByStepper() throws {
        let age = "35"
        let expectedAge = "36"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .tapIncreaseAge()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testTypingAgeFormKeyboardAndDecreasingByStepper() throws {
        let age = "45"
        let expectedAge = "44"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .tapDecreaseAge()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testTypingAgeFromKeyboardAndIncreasingAndThenDecreasingByStepper() throws {
        let age = "45"
        let expectedAge = "45"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .tapIncreaseAge()
            .tapDecreaseAge()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testTypingAgeFromKeyboardAndDecreasingAndThenIncreasingByStepper() throws {
        let age = "45"
        let expectedAge = "45"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .tapDecreaseAge()
            .tapIncreaseAge()
            .ageTextFieldValueEqualsTo(expectedAge)
    }

    func testAfterTypingMinimumValueDecreaseStepperIsInactive() throws {
        let minimumAge = "0"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(minimumAge)
            .ageDecreaseButtonIsNotEnabled()
    }

    func testAfterTypingMinimumValueIncreaseStepperIsActive() throws {
        let minimumAge = "0"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(minimumAge)
            .ageIncreaseButtonIsEnabled()
    }

    func testAfterTypingMaximumValueIncreaseStepperIsInactive() throws {
        let maximumAge = "99"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(maximumAge)
            .ageIncreaseButtonIsNotEnabled()
    }

    func testAfterTypingMaximumValueDecreaseStepperIsActive() throws {
        let maximumAge = "99"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(maximumAge)
            .ageDecreaseButtonIsEnabled()
    }

    func testAfterIncreasingToMaximumValueByStepperIncreaseStepperIsInactive() {
        let age = "98"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .tapIncreaseAge()
            .ageIncreaseButtonIsNotEnabled()
    }

    func testAfterIncreasingToMaximumValueByStepperDecreaseStepperIsActive() {
        let age = "98"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .tapIncreaseAge()
            .ageDecreaseButtonIsEnabled()
    }

    func testAfterDecreasingToMinimumValueByStepperDecreaseStepperIsInactive() {
        let age = "1"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .tapDecreaseAge()
            .ageDecreaseButtonIsNotEnabled()
    }

    func testAfterDecreasingToMinimumValueByStepperIncreaseStepperIsActive() {
        let age = "1"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .typeAge(age)
            .tapDecreaseAge()
            .ageIncreaseButtonIsEnabled()
    }
}
