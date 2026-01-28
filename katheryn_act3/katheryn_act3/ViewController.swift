//
//  ViewController.swift
//  katheryn_act3
//
//  Created by Alumno on 27/01/26.
//

import UIKit
import AudioToolbox


class ViewController: UIViewController {

    // Variables del juego
    var score = 0
    var timeLeft = 10
    var timer: Timer?

    // Conexiones con la interfaz
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }

    // Acción del botón
    @IBAction func buttonTapped(_ sender: UIButton) {
        if timeLeft > 0 {
                score += 1
                scoreLabel.text = "Puntos: \(score)"
                
                // Reproduce un sonido del sistema
                AudioServicesPlaySystemSound(1104) // sonido de "clic"

                UIView.animate(withDuration: 0.1) {
                    sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                } completion: { _ in
                    sender.transform = .identity
                }
            }
    }


    // Temporizador
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTime),
                                     userInfo: nil,
                                     repeats: true)
    }

    // Actualiza el tiempo
    @objc func updateTime() {
        timeLeft -= 1
        timeLabel.text = "Tiempo: \(timeLeft)"

        if timeLeft <= 0 {
            timer?.invalidate()
        }
    }
}

