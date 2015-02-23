//
//  ViewController.swift
//  KJGRealm
//
//  Created by Kevin Griffin on 2/23/15.
//  Copyright (c) 2015 Scoir, Inc. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController {

    let realm:RLMRealm = RLMRealm.defaultRealm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var parseError: NSError?
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(response.dataUsingEncoding(NSUTF8StringEncoding)!,
            options: NSJSONReadingOptions.AllowFragments,
            error:&parseError)
        
        println(RLMRealm.defaultRealm().path)
        
        if let response = parsedObject as? [String:AnyObject] {
            if let notebs = response["Notebooks"] as? [String:AnyObject] {
                Notebook.deleteMyNotebooks()
                Notebook.save(Array(notebs.values).map({
                    Notebook(response: $0 as [String:AnyObject])
                }))
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let response = "{\"Following\": [{\"Scid\": 1100133, \"Name\": \"Pittsburgh, University of\", \"RCProfile\": \"University of Pittsburgh, founded in 1787, is a public, comprehensive university. Its 132-acre campus is located in Pittsburgh.\", \"Address\": \"4200 Fifth Avenue\", \"City\": \"Pittsburgh\", \"State\": \"PA\", \"Zip\": \"15260\", \"Region\": \"Northeast\", \"Control\": \"Public\", \"Locale\": \"\", \"Size\": 18304, \"Enrollment\": 28649, \"UnderGradEnroll\": 18304, \"MaleEnroll\": 13873, \"Tuition\": 16872, \"Selectivity\": 54.45104, \"FinancialAidMet\": 54, \"Setting\": \"Major City\", \"CoedInfo\": \"Coed\", \"Religious\": \"\", \"Rotc\": [\"Air Force (on campus)\", \"Army (on campus)\", \"Navy (off campus)\"], \"ClubMen\": [\"airsoft\", \"cross-country\", \"crew\", \"cycling\", \"equestrian sports\", \"fencing\", \"field hockey\", \"golf\", \"hurling\", \"ice hockey\", \"judo\", \"lacrosse\", \"Quidditch\", \"roller hockey\", \"rugby\", \"sailing\", \"skiing and snowboarding\", \"swimming\", \"tennis\", \"water polo\"], \"ClubWomen\": [\"airsoft\", \"crew\", \"cross-country\", \"cycling\", \"fast-pitch softball\", \"fencing\", \"field hockey\", \"golf\", \"gymnastics\", \"hurling\", \"ice hockey\", \"judo\", \"lacrosse\", \"Quidditch\", \"roller hockey\", \"rugby\", \"sailing\", \"skiing and snowboarding\", \"soccer\", \"swimming\", \"equestrian sports\", \"tennis\", \"ultimate Frisbee\", \"water polo\"], \"Intramural\": [\"aerobics\", \"badminton\", \"basketball\", \"football\", \"handball\", \"racquetball\", \"soccer\", \"squash\", \" ultimate Frisbee\", \"volleyball\"], \"Majors\": [\"Accounting\", \"Criminal Justice/Law Enforcement Administration\", \"Astronomy\", \"Athletic Training/Trainer\", \"Business Administration and Management, General\", \"Management Information Systems, General\", \"Engineering Science\", \"Human Resources Management/Personnel Administration, General\", \"Area Studies, Other\", \"Mathematics\", \"Biometry/Biometrics\", \"Nursing\", \"Foods, Nutrition, and Wellness Studies, General\", \"Russian Studies\", \"Legal Studies, General\", \"Finance, General\", \"Operations Management and Supervision\", \"Biology Technician/Biotechnology Laboratory Technician\", \"Pharmaceutics and Drug Design (MS, PhD)\", \"Nursing\", \"Developmental and Child Psychology\", \"Mathematics and Statistics, Other\", \"Computer Engineering, General\", \"Dental Clinical Sciences, General (MS, PhD)\", \"Industrial Engineering\", \"Medicine (MD)\", \"Dental Clinical Sciences, General (MS, PhD)\", \"Pharmacy (PharmD [USA] PharmD, BS/BPharm [Canada])\", \"Physical Therapy/Therapist\", \"Psychology, General\", \"Speech-Language Pathology/Pathologist\", \"European Studies/Civilization\", \"Film/Cinema Studies\", \"Health/Health Care Administration/Management\", \"Management Science, General\", \"Nursing\", \"Biology, General\", \"Clinical Laboratory Science/Medical Technology/Technologist\", \"Biochemistry, Biophysics and Molecular Biology\", \"Nurse Anesthetist\", \"Multi-/Interdisciplinary Studies, Other\", \"Genetics, Other\", \"Computer Programming, Specific Applications\", \"Information Science/Studies\", \"Developmental and Child Psychology\", \"Statistics, General\", \"Computer Science\", \"Environmental Health\", \"Materials Science\", \"Music, General\", \"Nuclear Engineering\", \"Nutrition Sciences\", \"Dental Clinical Sciences, General (MS, PhD)\", \"Pharmacy Administration and Pharmacy Policy and Regulatory Affairs (MS, PhD)\", \"Physician Assistant\", \"Public Administration and Social Service Professions, Other\", \"Health/Health Care Administration/Management\", \"Film/Cinema Studies\", \"History Teacher Education\", \"Orthotist/Prosthetist\", \"Business Administration and Management, General\", \"German Studies\", \"Information Science/Studies\", \"Management Information Systems and Services, Other\", \"Political Science and Government, Other\", \"Computer Programming\", \"Communication and Media Studies, Other\", \"Health and Physical Education, General\", \"International/Global Studies\", \"Nursing - Registered Nurse Training (RN, ASN,BSN, MSN)\", \"Clinical Nurse Specialist\", \"Education, Other\", \"Health and Physical Education, General\", \"Nursing, Other\", \"Biochemistry, Biophysics and Molecular Biology\", \"Health and Physical Education, General\", \"International Relations and Affairs\", \"Public Health, Other\", \"Dental Hygiene/Hygienist\", \"Health/Health Care Administration/Management\", \"Humanities/Humanistic Studies\", \"Biological and Physical Sciences\", \"Public Administration\", \"Social Sciences, General\", \"Developmental and Child Psychology\", \"Liberal Arts and Sciences/Liberal Studies\", \"Developmental and Child Psychology\", \"Educational Administration and Supervision, Other\", \"Education, Other\", \"Educational Psychology\", \"Educational Administration and Supervision, Other\", \"Education, Other\", \"Psychology, Other\", \"Biomedical/Medical Engineering\", \"Chemical Engineering\", \"Civil Engineering, General\", \"Computer Engineering, General\", \"Electrical, Electronics and Communications Engineering\", \"Engineering Physics\", \"Industrial Engineering\", \"Materials Science\", \"Mechanical Engineering\", \"Biomedical/Medical Engineering\", \"Chemical Engineering\", \"Civil Engineering, General\", \"Electrical, Electronics and Communications Engineering\", \"Materials Science\", \"Mechanical Engineering\", \"Biomedical/Medical Engineering\", \"Chemical Engineering\", \"Civil Engineering, General\", \"Computer Engineering, General\", \"Electrical, Electronics and Communications Engineering\", \"Industrial Engineering\", \"Mechanical Engineering\", \"Petroleum Engineering\", \"Dietetics/Dietitian (RD)\", \"Communication, Journalism, and Related Programs, Other\", \"Health and Medical Administrative Services, Other\", \"Occupational Therapy/Therapist\", \"Emergency Medical Technology/Technician (EMT Paramedic)\", \"Rehabilitation and Therapeutic Professions, Other\", \"Audiology/Audiologist and Hearing Sciences\", \"Communication Disorders Sciences and Services,Other\", \"Rehabilitation and Therapeutic Professions, Other\", \"Communication Disorders Sciences and Services,Other\", \"Medical Scientist (MS, PhD)\", \"Occupational Therapy/Therapist\", \"Information Science/Studies\", \"Information Science/Studies\", \"Library Science, Other\", \"Library Science, Other\", \"Communications Technologies/Technicians and Support Services, Other\", \"Information Science/Studies\", \"Nursing, Other\", \"Nursing, Other\", \"Nursing, Other\", \"Nursing Science (MS, PhD)\", \"Nurse/Nursing Assistant/Aide and Patient Care Assistant\", \"Pharmacy Administration and Pharmacy Policy and Regulatory Affairs (MS, PhD)\", \"Pharmacy, Pharmaceutical Sciences, and Administration, Other\", \"Social Work\", \"Social Work\", \"Social Work\", \"Business Administration and Management, General\", \"Business Administration and Management, General\", \"International Business/Trade/Commerce\", \"Public Administration and Social Service Professions, Other\", \"Public Policy Analysis\", \"Business Administration and Management, General\", \"Security and Loss Prevention Services\", \"Urban Studies/Affairs\", \"Development Economics and International Development\", \"Sociology\", \"Dental Clinical Sciences, General (MS, PhD)\", \"Dental Clinical Sciences, General (MS, PhD)\", \"Dental Clinical Sciences, General (MS, PhD)\", \"Dental Clinical Sciences, General (MS, PhD)\", \"Dental Clinical Sciences, General (MS, PhD)\", \"Biological and Biomedical Sciences, Other\", \"Occupational Health and Industrial Hygiene\", \"Epidemiology\", \"Animal Genetics\", \"Medical Microbiology and Bacteriology\", \"Health Aide\", \"Biostatistics\", \"Epidemiology\", \"Allied Health Diagnostic, Intervention, and Treatment Professions, Other\", \"Animal Genetics\", \"Public Health, Other\", \"Occupational Health and Industrial Hygiene\", \"Public Health, General (MPH, DPH)\", \"Health Professions and Related Clinical Sciences, Other\", \"Immunology\", \"Pharmacology\", \"Neuroscience\", \"Pathology/Experimental Pathology\", \"Virology\", \"Cell/Cellular Biology and Anatomical Sciences, Other\", \"Biomedical Technology/Technician\", \"Information Science/Studies\", \"Immunology\", \"Health Professions and Related Clinical Sciences, Other\", \"Neuroscience\", \"Pathology/Experimental Pathology\", \"Virology\", \"Cell/Cellular Biology and Anatomical Sciences, Other\", \"Pharmacology\", \"Health Professions and Related Clinical Sciences, Other\", \"Actuarial Science\", \"African Studies\", \"Anthropology\", \"Applied Mathematics\", \"Historic Preservation and Conservation\", \"Biology/Biological Sciences, General\", \"Chemistry, General\", \"Chinese Language and Literature\", \"Classics and Classical Languages, Literatures,and Linguistics, General\", \"Computer Science\", \"Evolutionary Biology\", \"Economics, General\", \"Statistics, General\", \"English Language and Literature, General\", \"Geology/Earth Science, General\", \"Environmental Studies\", \"Film/Cinema Studies\", \"French Language and Literature\", \"Business Administration and Management, General\", \"Geology/Earth Science, General\", \"History, General\", \"Art History, Criticism and Conservation\", \"History and Philosophy of Science and Technology\", \"Multi-/Interdisciplinary Studies, Other\", \"Italian Language and Literature\", \"Japanese Language and Literature\", \"Linguistics\", \"Marketing/Marketing Management, General\", \"Mathematics, General\", \"Philosophy\", \"Medical Microbiology and Bacteriology\", \"Molecular Biology\", \"Music, General\", \"Neuroscience\", \"Philosophy\", \"Physics, General\", \"Physics, General\", \"Slavic, Baltic and Albanian Languages, Literatures, and Linguistics\", \"Political Science and Government, General\", \"Political Science and Government, General\", \"Psychology, General\", \"Religion/Religious Studies\", \"Russian Language and Literature\", \"General Sales, Merchandising and Related Marketing Operations\", \"Sociology\", \"Spanish Language and Literature\", \"Statistics, General\", \"Fine/Studio Arts, General\", \"Drama and Dramatics/Theatre Arts, General\", \"Urban Studies/Affairs\", \"Speech and Rhetorical Studies\", \"Computer and Information Sciences and Support Services, Other\", \"English Language and Literature/Letters, Other\", \"English Composition\", \"Anthropology\", \"Biological and Biomedical Sciences, Other\", \"Chemistry, General\", \"Classics and Classical Languages, Literatures,and Linguistics, General\", \"Computer Science\", \"Economics, General\", \"English Language and Literature, General\", \"French Language and Literature\", \"Geology/Earth Science, General\", \"Spanish Language and Literature\", \"History, General\", \"History, Other\", \"History and Philosophy of Science and Technology\", \"Information Science/Studies\", \"Linguistics\", \"Mathematics, General\", \"Music, General\", \"Neuroscience\", \"Philosophy\", \"Physics, General\", \"Political Science and Government, General\", \"Religion/Religious Studies\", \"Speech and Rhetorical Studies\", \"Sociology\", \"Statistics, General\", \"Visual and Performing Arts, General\", \"Slavic, Baltic and Albanian Languages, Literatures, and Linguistics\", \"Hispanic-American, Puerto Rican, and Mexican-American/Chicano Studies\", \"Anthropology\", \"Mathematics and Statistics, Other\", \"Biological and Biomedical Sciences, Other\", \"Biological and Physical Sciences\", \"Chemistry, General\", \"Classics and Classical Languages, Literatures,and Linguistics, General\", \"East Asian Studies\", \"Economics, General\", \"English Language and Literature, General\", \"French Language and Literature\", \"Geography\", \"Geology/Earth Science, General\", \"Foreign Languages, Literatures, and Linguistics, Other\", \"History, General\", \"Art History, Criticism and Conservation\", \"History and Philosophy of Science and Technology\", \"Systems Science and Theory\", \"Italian Language and Literature\", \"Linguistics\", \"Mathematics, General\", \"Neuroscience\", \"Philosophy\", \"Physics, General\", \"Political Science and Government, General\", \"Psychology, General\", \"Religion/Religious Studies\", \"Communication Studies/Speech Communication and Rhetoric\", \"Slavic, Baltic and Albanian Languages, Literatures, and Linguistics\", \"Sociology\", \"Statistics, General\", \"Drama and Dramatics/Theatre Arts, General\", \"Hispanic-American, Puerto Rican, and Mexican-American/Chicano Studies\", \"Mathematics, General\", \"Business Administration and Management, General\", \"Marketing/Marketing Management, General\", \"Law (LL.B., J.D.)\", \"Legal Professions and Studies, Other\"], \"Location\": [-79.95469, 40.444504], \"SATAvg\": 1890, \"SATMin\": 1750, \"SATMax\": 2030, \"ACTAvg\": 28, \"ACTMin\": 26, \"ACTMax\": 31, \"WhiteEnroll\": 14063, \"HispanicEnroll\": 474, \"AsianEnroll\": 1376, \"BlackEnroll\": 1000, \"Url\": \"\", \"TopCollegeTags\": null, \"Tags\": null, \"TopCollegePhotos\": null, \"TopUserPhotos\": null, \"Favorite\": true }, {\"Scid\": 2100332, \"Name\": \"Indiana University of Pennsylvania\", \"RCProfile\": \"Indiana University of Pennsylvania, founded in 1875, is a public, comprehensive institution. Programs are offered through the Colleges of Business, Education, Fine Arts, Health and Human Services, Humanities and Social Sciences, and Natural Sciences and Mathematics and Academic Affairs/Adult and Continuing Education. Its 374-acre campus is located in western Pennsylvania, 65 miles from Pittsburgh.\", \"Address\": \"1011 South Drive\", \"City\": \"Indiana\", \"State\": \"PA\", \"Zip\": \"15705\", \"Region\": \"Northeast\", \"Control\": \"Public\", \"Locale\": \"\", \"Size\": 24579, \"Enrollment\": 14728, \"UnderGradEnroll\": 12108, \"MaleEnroll\": 6568, \"Tuition\": 6820, \"Selectivity\": 90.487885, \"FinancialAidMet\": 0, \"Setting\": \"Small Town\", \"CoedInfo\": \"Coed\", \"Religious\": \"\", \"Rotc\": [\"Army (on campus)\"], \"ClubMen\": [\"baseball\", \"cycling\", \"equestrian sports\", \"fencing\", \"ice hockey\", \"lacrosse\", \"marital arts\", \"paintball\", \"rifle\", \"rugby\", \"running\", \"sailing\", \"swimming\", \"tennis\", \"ultimate Frisbee\", \"volleyball\", \"wrestling\"], \"ClubWomen\": [\"tennis\", \"cycling\", \"equestrian sports\", \"fencing\", \"ice hockey\", \"martial arts\", \"paintball\", \"rifle\", \"sailing\", \"swimming\", \"ultimate Frisbee\", \"soccer\", \"ice hockey\", \"rugby\", \"wrestling\"], \"Intramural\": [\"basketball\", \"flag football\", \"golf\", \"soccer\", \"softball\", \"tennis\", \"volleyball\"], \"Majors\": [\"General Studies\", \"Accounting\", \"Asian Studies/Civilization\", \"Athletic Training/Trainer\", \"Early Childhood Education and Teaching\", \"Fashion Merchandising\", \"Hospitality Administration/Management, General\", \"International Business\", \"Fine Arts and Art Studies, Other\", \"Management Information Systems and Services, Other\", \"Mathematics\", \"Nursing\", \"Junior High/Intermediate/Middle School Education and Teaching\", \"Finance, General\", \"Music Performance, General\", \"Clinical/Medical Laboratory Science and Allied Professions, Other\", \"Family and Consumer Economics and Related Services, Other\", \"Nursing, Other\", \"Security and Protective Services, Other\", \"Curriculum and Instruction\", \"Non-Profit/Public/Organizational Management\", \"Psychology\", \"Communications Technologies/Technicians and Support Services, Other\", \"Business Administration and Management, General\", \"Mental and Social Health Services and Allied Professions, Other\", \"Health and Medical Administrative Services, Other\", \"Health and Physical Education, General\", \"Music, General\", \"Speech-Language Pathology/Pathologist\", \"Teaching English as a Second or Foreign Language/ESL Language Instructor\", \"Labor Studies\", \"Archeology\", \"English Language and Literature, General\", \"School Psychology\", \"Criminology\", \"Educational Leadership and Administration, General\", \"Business Teacher Education\", \"Human Resources Management/Personnel Administration, General\", \"Management Information Systems, General\", \"Marketing/Marketing Management, General\", \"Business and Personal/Financial Services Marketing Operations\", \"Biology Teacher Education\", \"Chemistry Teacher Education\", \"Communication Studies/Speech Communication and Rhetoric\", \"Speech-Language Pathology/Pathologist\", \"Trade and Industrial Teacher Education\", \"Education, General\", \"Educational Psychology\", \"English Language and Literature, General\", \"Teaching English as a Second or Foreign Language/ESL Language Instructor\", \"Educational Psychology\", \"Counselor Education/School Counseling and Guidance Services\", \"Business Administration and Management, General\", \"Education\", \"Elementary Education and Teaching\", \"Art/Art Studies, General\", \"Art Teacher Education\", \"Fine/Studio Arts, General\", \"Music, General\", \"Music Teacher Education\", \"Drama and Dramatics/Theatre Arts, General\", \"Art/Art Studies, General\", \"Art/Art Studies, General\", \"Adult and Continuing Education Administration\", \"Adult and Continuing Education Administration\", \"Anthropology\", \"Criminology\", \"Economics, General\", \"English Language and Literature, General\", \"English/Language Arts Teacher Education\", \"General Studies\", \"Geography\", \"History, General\", \"International Relations and Affairs\", \"Journalism\", \"Philosophy\", \"Political Science and Government, General\", \"City/Urban, Community and Regional Planning\", \"Religion/Religious Studies\", \"Social Science Teacher Education\", \"Sociology\", \"Spanish Language and Literature\", \"Foreign Language Teacher Education\", \"Spanish Language and Literature\", \"Criminology\", \"Geography\", \"History, General\", \"Public Administration\", \"Sociology\", \"Biochemistry\", \"Biology/Biological Sciences, General\", \"Pre-Medicine/Pre-Medical Studies\", \"Chemistry, General\", \"Computer Science\", \"Science Teacher Education/General Science Teacher Education\", \"Geology/Earth Science, General\", \"Mathematics Teacher Education\", \"Biological and Physical Sciences\", \"Physics, General\", \"Physics Teacher Education\", \"Psychology, General\", \"Mathematics and Statistics, Other\", \"Biology/Biological Sciences, General\", \"Foods, Nutrition, and Wellness Studies, General\", \"Geography\", \"Nursing, Other\", \"Biological and Biomedical Sciences, Other\", \"Health Professions and Related Clinical Sciences, Other\", \"Physical Education Teaching and Coaching\", \"Interior Design\", \"Nuclear Medical Technology/Technologist\", \"Physical Education Teaching and Coaching\", \"Respiratory Care Therapy/Therapist\", \"Foods, Nutrition, and Wellness Studies, General\", \"Family Systems\"], \"Location\": [-79.15987, 40.61559], \"SATAvg\": 1445, \"SATMin\": 1300, \"SATMax\": 1590, \"ACTAvg\": 0, \"ACTMin\": 0, \"ACTMax\": 0, \"WhiteEnroll\": 9551, \"HispanicEnroll\": 373, \"AsianEnroll\": 116, \"BlackEnroll\": 1276, \"Url\": \"\", \"TopCollegeTags\": null, \"Tags\": null, \"TopCollegePhotos\": null, \"TopUserPhotos\": null, \"Favorite\": true }, {\"Scid\": 1100242, \"Name\": \"Villanova University\", \"RCProfile\": \"Villanova University, founded in 1842, is a private, coeducational institution. Its 254-acre campus is located in Villanova, PA.\", \"Address\": \"800 Lancaster Avenue\", \"City\": \"Villanova\", \"State\": \"PA\", \"Zip\": \"19085\", \"Region\": \"Northeast\", \"Control\": \"Private (nonprofit)\", \"Locale\": \"\", \"Size\": 13902, \"Enrollment\": 10697, \"UnderGradEnroll\": 6860, \"MaleEnroll\": 5235, \"Tuition\": 45376, \"Selectivity\": 48.904182, \"FinancialAidMet\": 0, \"Setting\": \"Small Town\", \"CoedInfo\": \"Coed\", \"Religious\": \"Roman Catholic Church (Augustinian)\", \"Rotc\": [\"Air Force (off campus)\", \"Army (on campus)\", \"Navy (on campus)\"], \"ClubMen\": [\"badminton\", \"baseball\", \"basketball\", \"curling\", \"cycling\", \"equestrian sports\", \"golf\", \"ice hockey\", \"judo\", \"lacrosse\", \"martial arts\", \"roller hockey\", \"rowing\", \"rugby\", \"running\", \"sailing\", \"skiing\", \"snowboarding\", \"soccer\", \"swimming\", \"tennis\", \"ultimate Frisbee\", \"volleyball\", \"water polo\"], \"ClubWomen\": [\"badminton\", \"basketball\", \"curling\", \"cycling\", \"equestrian sports\", \"field hockey\", \"ice hockey\", \"judo\", \"lacrosse\", \"martial arts\", \"roller hockey\", \"running\", \"sailing\", \"skiing\", \"snowboarding\", \"soccer\", \"swimming\", \"tennis\", \"ultimate Frisbee\", \"volleyball\"], \"Intramural\": [\"5K run\", \"5-on-5 basketball\", \"dodgeball\", \"flag football\", \"indoor soccer\", \"kickball\", \"outdoor soccer\", \"sand volleyball\", \"softball\", \"tennis\", \"ultimate Frisbee\", \"volleyball\", \"Wiffle ball\"], \"Majors\": [\"Criminology\", \"Ethnic, Cultural Minority, and Gender Studies, Other\", \"Environmental Studies\", \"Environmental Studies\", \"Finance, General\", \"French Language and Literature\", \"General Studies\", \"Information Science/Studies\", \"International Business/Trade/Commerce\", \"Latin American Studies\", \"Liberal Arts and Sciences/Liberal Studies\", \"Business Administration and Management, General\", \"Mathematics, General\", \"Nursing - Registered Nurse Training (RN, ASN,BSN, MSN)\", \"Real Estate\", \"Liberal Arts and Sciences/Liberal Studies\", \"Women's Studies\", \"Biological and Physical Sciences\", \"Communication and Media Studies, Other\", \"Nursing\", \"Counselor Education/School Counseling and Guidance Services\", \"Mathematics, General\", \"Computer Engineering, General\", \"Biomedical/Medical Engineering\", \"Public Administration\", \"Engineering, Other\", \"Management Information Systems, General\", \"Statistics\", \"Computer Science\", \"Accounting\", \"Business Administration and Management, General\", \"Economics, General\", \"Management Information Systems, General\", \"Marketing/Marketing Management, General\", \"Accounting\", \"Business Administration and Management, General\", \"Finance, General\", \"Chemical Engineering\", \"Civil Engineering, General\", \"Computer Engineering, General\", \"Electrical, Electronics and Communications Engineering\", \"Mechanical Engineering\", \"Engineering, General\", \"Chemical Engineering\", \"Civil Engineering, General\", \"Computer Engineering, General\", \"Electrical, Electronics and Communications Engineering\", \"Mechanical Engineering\", \"Agriculture, Agriculture Operations, and Related Sciences\", \"Art/Art Studies, General\", \"Astrophysics\", \"Biochemistry\", \"Biology/Biological Sciences, General\", \"Chemistry, General\", \"Classics and Classical Languages, Literatures,and Linguistics, General\", \"Communication Studies/Speech Communication and Rhetoric\", \"Computer Science\", \"Economics, General\", \"English Language and Literature, General\", \"Liberal Arts and Sciences/Liberal Studies\", \"History, General\", \"Humanities/Humanistic Studies\", \"Italian Language and Literature\", \"Philosophy\", \"Physics, General\", \"Political Science and Government, General\", \"Psychology, General\", \"Secondary Education and Teaching\", \"Sociology\", \"Spanish Language and Literature\", \"Theology/Theological Studies\", \"Multi/Interdisciplinary Studies, Other\", \"Nursing, Other\", \"Nursing, Other\", \"Philosophy\", \"Biology/Biological Sciences, General\", \"Chemistry, General\", \"Classics and Classical Languages, Literatures,and Linguistics, General\", \"Education, General\", \"English Language and Literature, General\", \"Hispanic-American, Puerto Rican, and Mexican-American/Chicano Studies\", \"History, General\", \"Liberal Arts and Sciences/Liberal Studies\", \"Philosophy\", \"Political Science and Government, General\", \"Psychology, General\", \"Drama and Dramatics/Theatre Arts, General\", \"Theology/Theological Studies\", \"Human Resources Management/Personnel Administration, General\", \"Communication and Media Studies, Other\", \"Law (LL.B., J.D.)\", \"Taxation\"], \"Location\": [-75.34546, 40.039387], \"SATAvg\": 1950, \"SATMin\": 1810, \"SATMax\": 2090, \"ACTAvg\": 30, \"ACTMin\": 29, \"ACTMax\": 31, \"WhiteEnroll\": 5206, \"HispanicEnroll\": 487, \"AsianEnroll\": 463, \"BlackEnroll\": 306, \"Url\": \"\", \"TopCollegeTags\": null, \"Tags\": null, \"TopCollegePhotos\": null, \"TopUserPhotos\": null, \"Favorite\": false }], \"Matched\": [], \"Dismissed\": [], \"Tags\": [], \"Notebooks\": {\"2100332\": {\"Name\": \"Indiana University of Pennsylvania\", \"RCProfile\": \"Indiana University of Pennsylvania, founded in 1875, is a public, comprehensive institution. Programs are offered through the Colleges of Business, Education, Fine Arts, Health and Human Services, Humanities and Social Sciences, and Natural Sciences and Mathematics and Academic Affairs/Adult and Continuing Education. Its 374-acre campus is located in western Pennsylvania, 65 miles from Pittsburgh.\", \"Address\": \"1011 South Drive\", \"City\": \"Indiana\", \"State\": \"PA\", \"Zip\": \"15705\", \"Region\": \"Northeast\", \"Control\": \"Public\", \"Locale\": \"\", \"Size\": 24579, \"Enrollment\": 14728, \"UnderGradEnroll\": 12108, \"MaleEnroll\": 6568, \"Tuition\": 6820, \"Selectivity\": 90.487885, \"FinancialAidMet\": 0, \"Setting\": \"Small Town\", \"CoedInfo\": \"Coed\", \"Religious\": \"\", \"Rotc\": [\"Army (on campus)\"], \"ClubMen\": [\"baseball\", \"cycling\", \"equestrian sports\", \"fencing\", \"ice hockey\", \"lacrosse\", \"marital arts\", \"paintball\", \"rifle\", \"rugby\", \"running\", \"sailing\", \"swimming\", \"tennis\", \"ultimate Frisbee\", \"volleyball\", \"wrestling\"], \"ClubWomen\": [\"tennis\", \"cycling\", \"equestrian sports\", \"fencing\", \"ice hockey\", \"martial arts\", \"paintball\", \"rifle\", \"sailing\", \"swimming\", \"ultimate Frisbee\", \"soccer\", \"ice hockey\", \"rugby\", \"wrestling\"], \"Intramural\": [\"basketball\", \"flag football\", \"golf\", \"soccer\", \"softball\", \"tennis\", \"volleyball\"], \"Majors\": [\"General Studies\", \"Accounting\", \"Asian Studies/Civilization\", \"Athletic Training/Trainer\", \"Early Childhood Education and Teaching\", \"Fashion Merchandising\", \"Hospitality Administration/Management, General\", \"International Business\", \"Fine Arts and Art Studies, Other\", \"Management Information Systems and Services, Other\", \"Mathematics\", \"Nursing\", \"Junior High/Intermediate/Middle School Education and Teaching\", \"Finance, General\", \"Music Performance, General\", \"Clinical/Medical Laboratory Science and Allied Professions, Other\", \"Family and Consumer Economics and Related Services, Other\", \"Nursing, Other\", \"Security and Protective Services, Other\", \"Curriculum and Instruction\", \"Non-Profit/Public/Organizational Management\", \"Psychology\", \"Communications Technologies/Technicians and Support Services, Other\", \"Business Administration and Management, General\", \"Mental and Social Health Services and Allied Professions, Other\", \"Health and Medical Administrative Services, Other\", \"Health and Physical Education, General\", \"Music, General\", \"Speech-Language Pathology/Pathologist\", \"Teaching English as a Second or Foreign Language/ESL Language Instructor\", \"Labor Studies\", \"Archeology\", \"English Language and Literature, General\", \"School Psychology\", \"Criminology\", \"Educational Leadership and Administration, General\", \"Business Teacher Education\", \"Human Resources Management/Personnel Administration, General\", \"Management Information Systems, General\", \"Marketing/Marketing Management, General\", \"Business and Personal/Financial Services Marketing Operations\", \"Biology Teacher Education\", \"Chemistry Teacher Education\", \"Communication Studies/Speech Communication and Rhetoric\", \"Speech-Language Pathology/Pathologist\", \"Trade and Industrial Teacher Education\", \"Education, General\", \"Educational Psychology\", \"English Language and Literature, General\", \"Teaching English as a Second or Foreign Language/ESL Language Instructor\", \"Educational Psychology\", \"Counselor Education/School Counseling and Guidance Services\", \"Business Administration and Management, General\", \"Education\", \"Elementary Education and Teaching\", \"Art/Art Studies, General\", \"Art Teacher Education\", \"Fine/Studio Arts, General\", \"Music, General\", \"Music Teacher Education\", \"Drama and Dramatics/Theatre Arts, General\", \"Art/Art Studies, General\", \"Art/Art Studies, General\", \"Adult and Continuing Education Administration\", \"Adult and Continuing Education Administration\", \"Anthropology\", \"Criminology\", \"Economics, General\", \"English Language and Literature, General\", \"English/Language Arts Teacher Education\", \"General Studies\", \"Geography\", \"History, General\", \"International Relations and Affairs\", \"Journalism\", \"Philosophy\", \"Political Science and Government, General\", \"City/Urban, Community and Regional Planning\", \"Religion/Religious Studies\", \"Social Science Teacher Education\", \"Sociology\", \"Spanish Language and Literature\", \"Foreign Language Teacher Education\", \"Spanish Language and Literature\", \"Criminology\", \"Geography\", \"History, General\", \"Public Administration\", \"Sociology\", \"Biochemistry\", \"Biology/Biological Sciences, General\", \"Pre-Medicine/Pre-Medical Studies\", \"Chemistry, General\", \"Computer Science\", \"Science Teacher Education/General Science Teacher Education\", \"Geology/Earth Science, General\", \"Mathematics Teacher Education\", \"Biological and Physical Sciences\", \"Physics, General\", \"Physics Teacher Education\", \"Psychology, General\", \"Mathematics and Statistics, Other\", \"Biology/Biological Sciences, General\", \"Foods, Nutrition, and Wellness Studies, General\", \"Geography\", \"Nursing, Other\", \"Biological and Biomedical Sciences, Other\", \"Health Professions and Related Clinical Sciences, Other\", \"Physical Education Teaching and Coaching\", \"Interior Design\", \"Nuclear Medical Technology/Technologist\", \"Physical Education Teaching and Coaching\", \"Respiratory Care Therapy/Therapist\", \"Foods, Nutrition, and Wellness Studies, General\", \"Family Systems\"], \"Location\": [-79.15987, 40.61559], \"SATAvg\": 1445, \"SATMin\": 1300, \"SATMax\": 1590, \"ACTAvg\": 0, \"ACTMin\": 0, \"ACTMax\": 0, \"WhiteEnroll\": 9551, \"HispanicEnroll\": 373, \"AsianEnroll\": 116, \"BlackEnroll\": 1276, \"Url\": \"\", \"Id\": \"54d51ac4c7c38b23f500004d\", \"StudentId\": \"546119a1c7c38b0001000002\", \"StudentName\": \"Kevin Griffin\", \"Scid\": 2100332, \"Shared\": false, \"SharedDate\": \"0001-01-01T00:00:00Z\", \"MediaIds\": [\"54620463c7c38b0001000002\", \"54bdc6dcc7c38b0001000042\", \"54bd68572fd4788bfa097e88\"], \"Media\": [{\"Id\": \"54620463c7c38b0001000002\", \"StudentId\": \"546119a1c7c38b0001000002\", \"Scid\": 2100332, \"SchoolName\": \"\", \"Caption\": \"puppy!\", \"Repins\": 0, \"Repinned\": false, \"Mime\": \"image/jpeg\", \"Size\": 331038, \"UploadDate\": \"2014-11-11T12:43:15.082Z\", \"Key\": \"n30inY2SStaunc47JTH7_photo.JPG\", \"Url\": \"https://scoir_staging.s3.amazonaws.com/notebooks/n30inY2SStaunc47JTH7_photo.JPG\", \"SUrl\": \"\", \"Dimension\": {\"X\": 1200, \"Y\": 1600 }, \"Hashtags\": null, \"Order\": 0, \"Shared\": false, \"Flagged\": false }, {\"Id\": \"54bdc6dcc7c38b0001000042\", \"StudentId\": \"546119a1c7c38b0001000002\", \"Scid\": 2100332, \"SchoolName\": \"\", \"Repins\": 0, \"Repinned\": false, \"Mime\": \"image/jpeg\", \"Size\": 334354, \"UploadDate\": \"2015-01-20T03:09:16.395Z\", \"Key\": \"D363DE202761411AAF3DE02A14B03981_C4F4DFCC-0BB2-4929-8A2F-98E52169FCD8\", \"SUrl\": \"\", \"Dimension\": {\"X\": 1280, \"Y\": 960 }, \"Hashtags\": [], \"Order\": 3, \"Shared\": false, \"Flagged\": false }, {\"Id\": \"54bd68572fd4788bfa097e88\", \"StudentId\": \"546119a1c7c38b0001000002\", \"Scid\": 2100332, \"SchoolName\": \"\", \"Text\": \"Neil \", \"Repins\": 0, \"Repinned\": false, \"Mime\": \"\", \"UploadDate\": \"2015-01-19T20:25:59.702Z\", \"SUrl\": \"\", \"Dimension\": {\"X\": 0, \"Y\": 0 }, \"Hashtags\": [], \"Order\": 7, \"Shared\": false, \"Flagged\": false }], \"Hashtags\": [], \"Cover\": {\"Id\": \"54620463c7c38b0001000002\", \"StudentId\": \"546119a1c7c38b0001000002\", \"Scid\": 2100332, \"SchoolName\": \"\", \"Caption\": \"puppy!\", \"Repins\": 0, \"Repinned\": false, \"Mime\": \"image/jpeg\", \"Size\": 331038, \"UploadDate\": \"2014-11-11T12:43:15.082Z\", \"Key\": \"n30inY2SStaunc47JTH7_photo.JPG\", \"Url\": \"https://scoir_staging.s3.amazonaws.com/notebooks/n30inY2SStaunc47JTH7_photo.JPG\", \"SUrl\": \"\", \"Dimension\": {\"X\": 1200, \"Y\": 1600 }, \"Hashtags\": null, \"Order\": 0, \"Shared\": false, \"Flagged\": false }, \"Following\": false, \"Favorite\": true } } }"
}

