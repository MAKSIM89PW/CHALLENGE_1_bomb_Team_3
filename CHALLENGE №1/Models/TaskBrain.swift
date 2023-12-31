//
//  TaskBrain.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 10.08.2023.
//

import Foundation


struct Tasks {
    
    let taskArray = [
        "Попробуйте произнести своё имя задом наперёд и включите в это немного драматического акцента.",
        "Попытайтесь повторить алфавит задом наперёд, начиная с 'Я'.",
        "Сделайте звук, который, по вашему мнению, издает трава, когда растёт.",
        "Используйте свой голос для эффектного воспроизведения звука машины, двигающейся по горной дороге.",
        "Воспроизведите классическую мелодию с участием 'инструментов' вашего тела (пальцы, губы и т.д.).",
        "Изобразите свой день на работе как немое кино.",
        "Представьте себя ведущим погодного прогноза и расскажите о погоде на вашей улице прямо сейчас.",
        "Сделайте самую смешную гримасу.",
        "Воспроизведите звук падения дождя, используя пальцы и губы.",
        "Попробуйте сделать впечатляющий звуковой эффект сверчка, находящегося на отдыхе.",
        "Попробуйте изобразить диалог между вашей рукой и вашей ногой.",
        "Попробуйте звучать, как алигатор, когда он говорит 'рррр'!",
        "Представьте, что вы рассказываете о вашей любимой еде, но делаете это на языке дельфина.",
        "Изобразите, что вы 'кролик' и подпрыгивайте вокруг как настоящий.",
        "Представьте, что вы главный художник и нарисуйте 'портрет' вашего друга на воображаемом холсте в воздухе.",
        "Попробуйте сделать звук, который издает лошадь, когда она счастлива.",
        "Изобразите, как вы идете под дождем и у вас нет зонта.",
        "Воспроизведите звуковой эффект, который возникает, когда кто-то приходит внезапно и пугает вас.",
        "Воспроизведите звук, который издает чайник, когда он закипает.",
        "Проигравший отправлет аудиосообщение последнему человеку в списке переписок, где поет куплет из любой известной песни.",
        "Изобразите, как вы берете 'селфи' с вымышленной знаменитостью."
    ]
    
    var currentTask: String = ""
    var newArrayOfTasks: [String] = []
    
    mutating func getRandomNonRepeatingTask() -> String {
        
        if newArrayOfTasks.isEmpty {
            newArrayOfTasks = taskArray
        }
        
        let randomIndex = Int.random(in: 0..<newArrayOfTasks.count)
        currentTask = newArrayOfTasks[randomIndex]
        newArrayOfTasks.remove(at: randomIndex)
        
        return currentTask
    }
}
