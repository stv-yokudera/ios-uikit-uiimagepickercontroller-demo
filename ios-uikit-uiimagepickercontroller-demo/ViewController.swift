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
}

// MARK: - file private
extension ViewController {
    @IBAction func didTapCameraButton(_ sender: Any) {
        guard let imagePicker = setupImagePicker(sourceType: .camera) else { return }
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func didTapPhotoLibraryButton(_ sender: Any) {
        guard let imagePicker = setupImagePicker(sourceType: .photoLibrary) else { return }
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func didTapSavedPhotosAlbumButton(_ sender: Any) {
        guard let imagePicker = setupImagePicker(sourceType: .savedPhotosAlbum) else { return }
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - setup
    
    fileprivate func setupImagePicker(sourceType: UIImagePickerControllerSourceType) -> UIImagePickerController? {
        
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            switch sourceType {
            case .camera:
                print("この端末はcameraが使えません")
            case .photoLibrary:
                print("この端末はphotoLibraryが使えません")
            case .savedPhotosAlbum:
                print("この端末はsavedPhotosAlbumが使えません")
            }
            return nil
        }
        
        let imagePicker = UIImagePickerController()
        // UINavigationControllerDelegateにも準拠している必要あり
        imagePicker.delegate = self
        
        // 画像取得先を選択する
        /*
         ※注意
         iOS10以降、写真やカメラにアクセスする際にinfo.plistにPrivacy - ○○ Usage Descriptionを設定し、使用目的を明記する
         　↓
         上記設定をしないとクラッシュする
         */
        imagePicker.sourceType = sourceType
        
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
