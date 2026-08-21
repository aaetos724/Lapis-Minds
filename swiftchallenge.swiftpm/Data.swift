//  Untitled.swift
//  swiftchallenge
//
//  Created by Elisa Torres on 18/02/26.
//
import Foundation


struct Scholar: Identifiable {
    let id = UUID()
    let name: String
    let nameFarsi: String
    let area: String
    let bioEn: String
    let bioFarsi: String
    let imageName: String
    let difficulty: Int
}

let afghanHeroes: [Scholar] = [
    Scholar(name: "Annisa Shaheed", nameFarsi: "انیسه شهید", area: "Journalism", bioEn: "A pioneer who became the first woman to anchor the news on TV.", bioFarsi: "پیشگامی که نخستین زن گوینده خبر در تلویزیون شد.", imageName: "annisa_shaheed", difficulty: 3),
    
    Scholar(name: "Azra Jafari", nameFarsi: "عذرا جعفری", area: "Politics", bioEn: "She made history as the first female mayor in Afghanistan.", bioFarsi: "او به عنوان نخستین شاروال زن در تاریخ افغانستان انتخاب شد.", imageName: "azra_jafari", difficulty: 3),
    
    Scholar(name: "Fawzia Koofi", nameFarsi: "فوزیه کوفی", area: "Politics", bioEn: "A brave leader who survived many dangers while fighting for girls' education.", bioFarsi: "رهبر شجاعی که با وجود خطرات زیاد برای آموزش دختران مبارزه کرد.", imageName: "fawzia_koofi", difficulty: 3),
    
    Scholar(name: "Habiba Sarabi", nameFarsi: "حبیبه سرابی", area: "Politics", bioEn: "The first female governor in Afghanistan. She worked to protect the history of Bamyan.", bioFarsi: "او نخستین والی زن در افغانستان بود. او برای حفاظت از تاریخ بامیان تلاش کرد.", imageName: "habiba_sarabi", difficulty: 3),
    
    Scholar(name: "Jamila Afghani", nameFarsi: "جمیله افغانی", area: "Education", bioEn: "She works with religious leaders to help more girls go to school.", bioFarsi: "او با علمای دین همکاری می‌کند تا به دختران بیشتری کمک کند به مکتب بروند.", imageName: "jamila_afghani", difficulty: 3),
    
    Scholar(name: "Pashtana Durrani", nameFarsi: " پشتانه درانی", area: "Education", bioEn: "A champion of digital learning who runs secret schools for girls.", bioFarsi: "حامی آموزش دیجیتال که مکاتب مخفی را برای دختران اداره می‌کند.", imageName: "pashtana_durrani", difficulty: 3),
    
    Scholar(name: "Mahbuba Maqsoodi", nameFarsi: "محبوبه مقصودی", area: "Music", bioEn: "An artist and musician who shares the traditional music of Afghanistan.", bioFarsi: "هنرمند و نوازنده‌ای که موسیقی سنتی افغانستان را به اشتراک می‌گذارد.", imageName: "mahbuba_maqsoodi", difficulty: 4),
    
    Scholar(name: "Masuda Jalal", nameFarsi: "مسعوده جلال", area: "Politics", bioEn: "The first woman to run for President of Afghanistan.", bioFarsi: "نخستین زنی که نامزد ریاست‌جمهوری افغانستان شد.", imageName: "masuda_jalal", difficulty: 4),
    
    Scholar(name: "Nadia Anjuman", nameFarsi: "نادیا انجمن", area: "Poetry", bioEn: "A modern poet who wrote about the hopes and dreams of Afghan women.", bioFarsi: "شاعر معاصری که درباره امیدها و رویاهای زنان افغان می‌نوشت.", imageName: "nadia_anjuman", difficulty: 4),
    
    Scholar(name: "Nazo Tokhi", nameFarsi: "نازو توخی", area: "Warrior & Poet", bioEn: "A brave warrior and poet known as the 'Mother of the Nation.'", bioFarsi: "شاعر و مبارز شجاع که به نام مادر ملت یاد می‌شود.", imageName: "nazo_tokhi", difficulty: 4),
    
    Scholar(name: "Rabia Balkhi", nameFarsi: "رابعه بلخی", area: "Poetry", bioEn: "The first famous female poet in the Persian language.", bioFarsi: "نخستین زن شاعر نامدار زبان فارسی.", imageName: "rabia_balkhi", difficulty: 4),
    
    Scholar(name: "Roya Mahboob", nameFarsi: "رویا محبوب", area: "Technology", bioEn: "A leader in technology who teaches girls how to code.", bioFarsi: "رهبری در بخش تکنالوژی که به دختران آموزش کدنویسی می‌دهد.", imageName: "roya_mahboob", difficulty: 5),
    
    Scholar(name: "Sakena Yacoobi", nameFarsi: "سکینه یعقوبی", area: "Education", bioEn: "She founded schools that helped thousands of girls and women learn.", bioFarsi: "او مکاتبی را تاسیس کرد که به هزاران دختر و زن کمک کرد درس بخوانند.", imageName: "sakena_yacoobi", difficulty: 5),
    
    Scholar(name: "Shamsia Hassani", nameFarsi: "شمسیه حسانی", area: "Art", bioEn: "A famous street artist who shows the strength and beauty of Afghan women.", bioFarsi: "هنرمند مشهور که قدرت و زیبایی زنان افغان را به تصویر می‌کشد.", imageName: "shamsia_hassani", difficulty: 5),
    
    Scholar(name: "Shinkai Karokhail", nameFarsi: "شینکی کروخیل", area: "Politics", bioEn: "A leader in parliament who helped pass laws to protect women's rights.", bioFarsi: "رهبری در پارلمان که به تصویب قوانینی برای حمایت از حقوق زنان کمک کرد.", imageName: "shinkai_karokhail", difficulty: 5),
    
    Scholar(name: "Sima Samar", nameFarsi: "سیما سمر", area: "Human Rights", bioEn: "A doctor who fought for the rights of women and children.", bioFarsi: "داکتری که برای حقوق زنان و کودکان مبارزه کرد.", imageName: "sima_samar", difficulty: 5),
    
    Scholar(name: "Suraya Dalil", nameFarsi: "ثریا دلیل", area: "Medicine", bioEn: "A doctor and leader who worked for the health of mothers and babies.", bioFarsi: "داکتر و رهبری که برای سلامت مادران و نوزادان تلاش کرد.", imageName: "suraya_dalil", difficulty: 5),
    
    Scholar(name: "Zarifa Ghafari", nameFarsi: "ظریفه غفاری", area: "Politics", bioEn: "One of the youngest female mayors who showed great bravery.", bioFarsi: "یکی از جوان‌ترین شاروال‌های زن که شجاعت زیادی نشان داد.", imageName: "zarifa_ghafari", difficulty: 5)
]
