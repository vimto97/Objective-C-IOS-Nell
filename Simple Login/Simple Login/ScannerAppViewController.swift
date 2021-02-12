//
//  ScannerAppViewController.swift
//  Simple Login
//
//  Created by Vimal Solanki on 26/03/2020.
//

import UIKit
import AVFoundation
class ScannerAppViewController: UIViewController, UINavigationControllerDelegate, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let captureSession = AVCaptureSession()
    var previewLayer:CALayer!
    
    var captureDevice:AVCaptureDevice!
    
    func prepareCamera(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        let avaibleDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
        captureDevice = avaibleDevices.first
        
        beginSession()
    }
    
    func beginSession(){
        do{
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        }catch{
            print(error.localizedDescription)
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer = previewLayer
        self.view.layer.addSublayer(self.previewLayer)
        self.previewLayer.frame = self.view.layer.frame
        captureSession.startRunning()
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as  String):NSNumber(value: kCVPixelFormatType_32BGRA)]
        
        dataOutput.alwaysDiscardsLateVideoFrames = true
        
        if captureSession.canAddOutput(dataOutput){
            captureSession.addOutput(dataOutput)
        }
        captureSession.commitConfiguration()
        
        let queue = DispatchQueue(label: "Capture")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
        
    }
    var takePhoto = false
    @IBAction func takePhoto(_ sender: Any) {
        takePhoto = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if takePhoto{
            takePhoto = false
            if let image = self.getImageFromSampleBuffer(buffer: sampleBuffer){
                
                let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoVC") as! PhotoViewController
                
                photoVC.takenPhoto = image
                DispatchQueue.main.async {
//                    self.present(photoVC, animated: true, completion: {self.stopCaptureSession()})
                self.present(photoVC, animated: true, completion: nil)
                    
                    
                }
            }
            
        }
    }
    
    func getImageFromSampleBuffer(buffer:CMSampleBuffer) -> UIImage?{
        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer){
            let ciImage = CIImage(cvImageBuffer: pixelBuffer)
            let context = CIContext()
            
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
            
            if let image = context.createCGImage(ciImage, from: imageRect){
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
            
        }
        return nil
    }
    
    func stopCaptureSession(){
        self.captureSession.stopRunning()
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput]{
            for input in inputs {
                self.captureSession.removeInput(input)
            }
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.prepareCamera()
//    }
    
    override func viewDidLoad() {
        prepareCamera()
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
