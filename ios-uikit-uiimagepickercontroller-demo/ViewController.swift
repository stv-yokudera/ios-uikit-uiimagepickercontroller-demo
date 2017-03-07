//
//  ViewController.swift
//  ios-uikit-uiimagepickercontroller-demo
//
//  Created by Kentaro on 2017/03/08.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    @IBAction private func didTapButton(_ sender: UIButton) {
        guard let imagePicker = setupImagePicker() else { return }
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - setup
    
    fileprivate func setupImagePicker() -> UIImagePickerController? {
        
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("この端末はphotoLibraryが使えません")
            return nil
        }
        
        let imagePicker = UIImagePickerController()
        // UINavigationControllerDelegateにも準拠している必要あり
        imagePicker.delegate = self
        
        // 画像取得先を選択する
        /*
         ※注意
         iOS10以降、写真にアクセスする際はinfo.plistにPrivacy - Photo Library Usage Descriptionを設定し、
         写真にアクセスする旨の文言をセットする
         　↓
         上記設定をしないとクラッシュする
         */
        imagePicker.sourceType = .photoLibrary
        
        // 画像取得後の編集を許可する
        imagePicker.allowsEditing = true
        
        return imagePicker
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    // 画像が選択されたら呼ばれる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            print("画像取得できたので、imageViewにセット")
            imageView.image = image
        }
        
        dismiss(animated: true)
    }
    
    // キャンセルされたら呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("キャンセルされました")
        dismiss(animated: true)
    }
}
