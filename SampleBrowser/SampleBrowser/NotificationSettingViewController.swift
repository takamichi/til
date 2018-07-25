//
//  NotificationSettingViewController.swift
//  SampleBrowser
//
//  Created by Takamichi URATA on 2018/07/23.
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationSettingViewController: UIViewController {

    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notificationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // UISwitch「通知の設定」を操作したときの処理
    @IBAction func onNotificationSwitchValueChanged(_ sender: UISwitch) {
    }

    // UIButton「通知を設定」を押したときの処理
    @IBAction func onNotificationButtonTapped(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        let date = datePicker.date

        // 通知の許可リクエストのダイアログを表示する
        // (すでに許可済みであれば、ダイアログの表示は省略される)
        center.requestAuthorization(
            options: [.alert, .sound],
            completionHandler: { granted, error in
                if error != nil {
                    let controller = UIAlertController(title: nil, message: "エラーが発生しました。", preferredStyle: .alert)
                    controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

                    self.present(controller, animated: true, completion: nil)

                    return
                }

                if granted {
                    center.removeAllPendingNotificationRequests()

                    // 通知内容の設定
                    let content = UNMutableNotificationContent()
                    content.title = "最新の記事をチェックしましょう"
                    content.subtitle = "今日の記事はチェックしましたか？"
                    content.body = "最新のニュースがあります"
                    content.sound = UNNotificationSound.default()

                    // 通知時間の設定
                    let calendar = Calendar.current
                    // datePickerで選択している時間
                    let dateComponents = calendar.dateComponents([.hour, .minute], from: date)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                    let identifier = "NewsNotification"
                    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

                    // 通知を登録
                    center.add(request, withCompletionHandler: nil)

                    let controller = UIAlertController(
                        title: nil,
                        message: "\(dateComponents.hour!):\(dateComponents.minute!)に通知する設定を行いました。",
                        preferredStyle: .alert
                    )
                    controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                } else {
                    let controller = UIAlertController(title: nil, message: "通知の設定が許可されていません。設定アプリから通知を許可してください。", preferredStyle: .alert)
                    controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(controller, animated: true, completion: nil)
                }
            })
    }

    // UIBarButton (閉じる) を押したときの処理
    @IBAction func onCloseButtonTapped(_ sender: UIBarButtonItem) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
}
