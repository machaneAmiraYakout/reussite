import '../model/module.dart';
import '../model/semestre.dart';
import '../model/year.dart';
final years = [
  YearData('1 ÈRE ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Anatomie', ['Course Anatomie 1', 'Course Anatomie 2'], ['QCM Anatomie'], ['Resume Anatomie'], ['Autre Anatomie'], imagePath: 'assets/anatomie.png',),
      ModuleData('Anglais', ['Course Anglais 1', 'Course Anglais 2'], ['QCM Anglais'], ['Resume Anglais'], ['Autre Anglais'],imagePath: 'assets/anglais.png',),
      ModuleData('Biochimie', ['Course Biochimie 1', 'Course Biochimie 2'], ['QCM Biochimie'], ['Resume Biochimie'], ['Autre Biochimie'],imagePath: 'assets/biochimie.png',),
      ModuleData('Biophysique', ['Course Biophysique 1', 'Course Biophysique 2'], ['QCM Biophysique'], ['Resume Biophysique'], ['Autre Biophysique'],imagePath: 'assets/biophysique.png'),
      ModuleData('Biostatistique', ['Course Biostatistique 1', 'Course Biostatistique 2'], ['QCM Biostatistique'], ['Resume Biostatistique'], ['Autre Biostatistique'],imagePath: 'assets/biostate.png',),
      ModuleData('Chimie', ['Course Chimie 1', 'Course Chimie 2'], ['QCM Chimie'], ['Resume Chimie'], ['Autre Chimie'],imagePath: 'assets/chimie.png',),
      ModuleData('Cytologie', ['Course Cytologie 1', 'Course Cytologie 2'], ['QCM Cytologie'], ['Resume Cytologie'], ['Autre Cytologie'], imagePath: 'assets/cytologie.png',),
      ModuleData('francais', ['Course francais 1', 'Course francais 2'], ['QCM francais'], ['Resume francais'], ['Autre francais'],imagePath: 'assets/francais.png',),
      ModuleData('histologie', ['Course histologie 1', 'Course histologie 2'], ['QCM histologie'], ['Resume histologie'], ['Autre histologie'],imagePath: 'assets/histologie.png',),
      ModuleData('genetique', ['Course genetique 1', 'Course genetique 2'], ['QCM genetique'], ['Resume genetique'], ['Autre genetique'],imagePath: 'assets/genetique.png',),
      ModuleData('physique', ['Course physique 1', 'Course physique 2'], ['QCM physique'], ['Resume physique'], ['Autre physique'],imagePath: 'assets/physique.png',),
    ]),
    SemesterData('Semestre 2', [
      ModuleData('Épidémiologie', ['Course Épidémiologie 1', 'Course Épidémiologie 2'], ['QCM Épidémiologie'], ['Resume Épidémiologie'], ['Autre Épidémiologie']),
      ModuleData('Santé Sociale', ['Course Santé Sociale 1', 'Course Santé Sociale 2'], ['QCM Santé Sociale'], ['Resume Santé Sociale'], ['Autre Santé Sociale']),
      ModuleData('Physiologie', ['Course Physiologie 1', 'Course Physiologie 2'], ['QCM Physiologie'], ['Resume Physiologie'], ['Autre Physiologie']),
      ModuleData('Embryologie', ['Course Embryologie 1', 'Course Embryologie 2'], ['QCM Embryologie'], ['Resume Embryologie'], ['Autre Embryologie']),
      ModuleData('Génétique', ['Course Génétique 1', 'Course Génétique 2'], ['QCM Génétique'], ['Resume Génétique'], ['Autre Génétique']),
      ModuleData('Histologie', ['Course Histologie 1', 'Course Histologie 2'], ['QCM Histologie'], ['Resume Histologie'], ['Autre Histologie']),
      ModuleData('Anatomie', ['Course Anatomie 1', 'Course Anatomie 2'], ['QCM Anatomie'], ['Resume Anatomie'], ['Autre Anatomie']),
      ModuleData('Anglais', ['Course Anglais 1', 'Course Anglais 2'], ['QCM Anglais'], ['Resume Anglais'], ['Autre Anglais']),
      ModuleData('Biochimie', ['Course Biochimie 1', 'Course Biochimie 2'], ['QCM Biochimie'], ['Resume Biochimie'], ['Autre Biochimie']),
      ModuleData('Biophysique', ['Course Biophysique 1', 'Course Biophysique 2'], ['QCM Biophysique'], ['Resume Biophysique'], ['Autre Biophysique']),
      ModuleData('Biostatistique', ['Course Biostatistique 1', 'Course Biostatistique 2'], ['QCM Biostatistique'], ['Resume Biostatistique'], ['Autre Biostatistique']),
      ModuleData('Chimie', ['Course Chimie 1', 'Course Chimie 2'], ['QCM Chimie'], ['Resume Chimie'], ['Autre Chimie']),
      ModuleData('Cytologie', ['Course Cytologie 1', 'Course Cytologie 2'], ['QCM Cytologie'], ['Resume Cytologie'], ['Autre Cytologie']),

    ]),
  ]),
  YearData('2 ÈME ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Anatomie dentaire', ['Course Anatomie dentaire1', 'Course Anatomie dentaire2'], ['QCM Anatomie dentaire'], ['Resume Anatomie dentaire'], ['Autre Anatomie dentaire']),
      ModuleData('Anatomie humaine', ['Course Anatomie humaine1', 'Course Anatomie humaine2'], ['QCM Anatomie humaine'], ['Resume Anatomie humaine'], ['Autre Anatomie humaine']),
      ModuleData('Microbiologie', ['Course Microbiologie1', 'Course Microbiologie2'], ['QCM Microbiologie'], ['Resume Microbiologie'], ['Autre Microbiologie']),
      ModuleData('Paro', ['Course Paro 1', 'Course Paro 2'], ['QCM Paro'], ['Resume Paro'], ['Autre Paro']),
      ModuleData('Histologie', ['Course Histologie 1', 'Course Histologie 2'], ['QCM Histologie'], ['Resume Histologie'], ['Autre Histologie']),
      ModuleData('Informatique', ['Course Informatique 1', 'Course Informatique 2'], ['QCM Informatique'], ['Resume Informatique'], ['Autre Informatique']),
      ModuleData('OCE', ['Course OCE 1', 'Course v 2'], ['QCM OCE'], ['Resume OCE'], ['Autre OCE']),

    ]),
    SemesterData('Semestre 2', [
      ModuleData('Anatomie dentaire2', ['Course Anatomie dentaire2 1', 'Course Anatomie dentaire2 2'], ['QCM Anatomie dentaire2'], ['Resume Anatomie dentaire2'], ['Autre Anatomie dentaire2']),
      ModuleData('Anatomie humaine2', ['Course Anatomie humaine2 1', 'Course Anatomie humaine2 2'], ['QCM Anatomie humaine2'], ['Resume Anatomie humaine2'], ['Autre Anatomie humaine2']),
      ModuleData('Microbiologie2', ['Course Microbiologie2 1', 'Course Microbiologie2 2'], ['QCM Microbiologie2'], ['Resume Microbiologie2'], ['Autre Microbiologie2']),
      ModuleData('Pathologie', ['Course Pathologie 1', 'Course Pathologie 2'], ['QCM Pathologie'], ['Resume Pathologie'], ['Autre Pathologie']),
      ModuleData('Immunologie', ['Course Immunologie 1', 'Course Immunologie 2'], ['QCM Immunologie'], ['Resume Immunologie'], ['Autre Immunologie']),
      ModuleData('OCE2', ['Course OCE2 1', 'Course OCE2 2'], ['QCM OCE2'], ['Resume OCE2'], ['Autre OCE2']),
      ModuleData('Physiologie', ['Course Physiologie 1', 'Course Physiologie 2'], ['QCM Physiologie'], ['Resume Physiologie'], ['Autre Physiologie']),
      ModuleData('hygiène vention', ['Course hygiène vention 1', 'Course hygiène vention 2'], ['QCM hygiène vention'], ['Resume hygiène vention'], ['Autre hygiène vention']),
      ModuleData('Biomat Oce', ['Course Biomat Oce 1', 'Course Biomat Oce 2'], ['QCM Biomat Oce'], ['Resume Biomat Oce'], ['Autre Biomat Oce']),

    ]),
  ]),
  YearData('3 ÈME ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Anapath', ['Course Anapath', 'Course Anapath'], ['QCM Anapath'], ['Resume Anapath'], ['Autre Anapath']),
      ModuleData('Oxyologie', ['Course Oxyologie 1', 'Course Oxyologie 2'], ['QCM Oxyologie'], ['Resume Oxyologie'], ['Autre Oxyologie']),
      ModuleData('PBD', ['Course PBD 1', 'Course PBD 2'], ['QCM PBD'], ['Resume PBD'], ['Autre PBD']),
      ModuleData('Prothèse', ['Course Prothèse 1', 'Course Prothèse 2'], ['QCM Prothèse'], ['Resume Prothèse'], ['Autre Prothèse']),
      ModuleData('Imager..dicale', ['Course Imager..dicale 1', 'Course Imager..dicale 2'], ['QCM Imager..dicale'], ['Resume Imager..dicale'], ['Autre Imager..dicale']),
      ModuleData('ODF', ['Course ODF 1', 'Course ODF 2'], ['QCM ODF'], ['Resume ODF'], ['Autre ODF']),
      ModuleData('OCE', ['Course OCE 1', 'Course v 2'], ['QCM OCE'], ['Resume OCE'], ['Autre OCE']),
      ModuleData('Parodo..logie', ['Course Parodo..logie 1', 'Course Parodo..logie 2'], ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
      ModuleData('Pharmacologie', ['Course Pharmacologie 1', 'Course Pharmacologie 2'], ['QCM Pharmacologie'], ['Resume Pharmacologie'], ['Autre Pharmacologie']),
    ]),
    SemesterData('Semestre 2', [
      ModuleData('Anesth..logie', ['Course Anesth..logie', 'Course Anesth..logie'], ['QCM Anesth..logie'], ['Resume Anesth..logie'], ['Autre Anesth..logie']),
      ModuleData('Occlusodente', ['Course Occlusodente 1', 'Course Occlusodente 2'], ['QCM Occlusodente'], ['Resume Occlusodente'], ['Autre Occlusodente']),
      ModuleData('PBD', ['Course PBD 1', 'Course PBD 2'], ['QCM PBD'], ['Resume PBD'], ['Autre PBD']),
      ModuleData('Prothèse', ['Course Prothèse 1', 'Course Prothèse 2'], ['QCM Prothèse'], ['Resume Prothèse'], ['Autre Prothèse']),
      ModuleData('Imager..dicale', ['Course Imager..dicale 1', 'Course Imager..dicale 2'], ['QCM Imager..dicale'], ['Resume Imager..dicale'], ['Autre Imager..dicale']),
      ModuleData('ODF', ['Course ODF 1', 'Course ODF 2'], ['QCM ODF'], ['Resume ODF'], ['Autre ODF']),
      ModuleData('OCE', ['Course OCE 1', 'Course v 2'], ['QCM OCE'], ['Resume OCE'], ['Autre OCE']),
      ModuleData('Parodo..logie', ['Course Parodo..logie 1', 'Course Parodo..logie 2'], ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
      ModuleData('Pharmacologie', ['Course Pharmacologie 1', 'Course Pharmacologie 2'], ['QCM Pharmacologie'], ['Resume Pharmacologie'], ['Autre Pharmacologie']),
    ]),
  ]),
  YearData('4 ÈME ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Parodo..logie', ['Course Parodo..logie 1', 'Course Parodo..logie 2'], ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
    ]),
    SemesterData('Semestre 2', [
      ModuleData('Parodo..logie', ['Course Parodo..logie 1', 'Course Parodo..logie 2'], ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
    ]),
  ]),
  YearData('5 ÈME ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Pharmacologie', ['Course Pharmacologie 1', 'Course Pharmacologie 2'], ['QCM Pharmacologie'], ['Resume Pharmacologie'], ['Autre Pharmacologie']),
    ]),
    SemesterData('Semestre 2', [
      ModuleData('Parodo..logie', ['Course Parodo..logie 1', 'Course Parodo..logie 2'], ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
    ]),
  ])
];