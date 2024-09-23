import '../model/module.dart';
import '../model/semestre.dart';
import '../model/year.dart';
final years = [
  YearData('1 ÈRE ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Anatomie',
        ['QCM Anatomie'],
        ['Resume Anatomie'],
        ['Autre Anatomie'],imagePath: 'assets/anatomie.png',
        coursesByYear: {
          '2023/2024': [
            'assets/pdfs/Anatomie/1-Généralités d\'Anatomie Humain.pdf',
            'assets/pdfs/Anatomie/2-Anatomie du Thorax.pdf',
            'assets/pdfs/Anatomie/3-App Respiratoire.pdf',
            'assets/pdfs/Anatomie/4-App Cardio-Vasculaire.pdf',
            'assets/pdfs/Anatomie/5-Abdomen-App Digestif.pdf'
          ],
          '2024/2025': [
          ],
        },
      ),
      ModuleData('Anglais' ,['QCM Anglais'], ['Resume Anglais'], ['Autre Anglais'],imagePath: 'assets/anglais.png',),
      ModuleData('Biochimie',
        ['QCM Biochimie'],
        ['Resume Biochimie'],
        ['Autre Biochimie'],
        imagePath: 'assets/biochimie.png',
        coursesByYear: {
          '2023/2024': [
            'assets/pdfs/Biochimie/1- Les Glucides.pdf',
            'assets/pdfs/Biochimie/2-Les Proteines 2023.pdf',
          ],
          '2024/2025': [
          ],
        },
      ),
      ModuleData('Biophysique', ['QCM Biophysique'], ['Resume Biophysique'], ['Autre Biophysique'],imagePath: 'assets/biophysique.png'),
      ModuleData('Biostatistique',
        ['QCM Biostatistique'],
        ['Resume Biostatistique'],
        ['Autre Biostatistique'],
        imagePath: 'assets/biostate.png',
        coursesByYear: {
          '2023/2024': [
            'assets/pdfs/Biostatistique/1-CONCEPTS DE BASE EN BIOSTATISTIQUE.pdf',
            'assets/pdfs/Biostatistique/2-STATISTIQUE DEFINITION ET TERMINOOGIE.pdf',
            'assets/pdfs/Biostatistique/3- STATISTIQUE DESCRIPTIVE.pdf',
            'assets/pdfs/Biostatistique/4-Les paramètres de réduction.pdf',
            'assets/pdfs/Biostatistique/5-La loi Normale.pdf',
            'assets/pdfs/Biostatistique/6-La loi Binomiale.pdf',
            'assets/pdfs/Biostatistique/7-La loi de Poisson.pdf',
          ],
          '2024/2025': [
          ],
        },
      ),
      ModuleData('Chimie',
        ['QCM Chimie'],
        ['Resume Chimie'],
        ['Autre Chimie'],
        imagePath: 'assets/chimie.png',
        coursesByYear: {
          '2023/2024': [
            'assets/pdfs/Chimie/Chapitre I.pdf',
            'assets/pdfs/Chimie/Chapitre II.pdf',
            'assets/pdfs/Chimie/Chapitre III.pdf',
            'assets/pdfs/Chimie/Chapitre IV.pdf',
            'assets/pdfs/Chimie/Chapitre V.pdf'
          ],
          '2024/2025': [
          ],
        },
      ),
      ModuleData('francais', ['QCM francais'], ['Resume francais'], ['Autre francais'],imagePath: 'assets/francais.png',),
      ModuleData('histoCyto', ['QCM histologie'], ['Resume histologie'], ['Autre histologie'],imagePath: 'assets/histologie.png',),
      ModuleData('genetique',
        ['QCM genetique'],
        ['Resume genetique'],
        ['Autre genetique'],
        imagePath: 'assets/genetique.png',
        coursesByYear: {
          '2023/2024': [
            'assets/pdfs/genetique/1-1-Structure de la chromatine et des chromosomes.pdf',
            'assets/pdfs/genetique/1-2-Les bases physiques de l’hérédité.pdf',
            'assets/pdfs/genetique/2-Monohybridisme.pdf',
            'assets/pdfs/genetique/3-Génétique humaine.pdf',
            'assets/pdfs/genetique/4-Hérédité liée au sexe.pdf',
            'assets/pdfs/genetique/5-Polyallélie.pdf',
            'assets/pdfs/genetique/6-Gènes létaux.pdf',
            'assets/pdfs/genetique/7-Dihybridisme.pdf',
            'assets/pdfs/genetique/8-Gènes liés.pdf',
            'assets/pdfs/genetique/9-1-Génétique moléculaire.pdf',
            'assets/pdfs/genetique/10-Les mutations.pdf',
            'assets/pdfs/genetique/11-Cytogénétique.pdf',
            'assets/pdfs/genetique/12-Outils de génie génétique.pdf',
            'assets/pdfs/genetique/13-Génétique bactérienne.pdf',
          ],
          '2024/2025': [
          ],
        },
      ),
      ModuleData('physique',  ['QCM physique'], ['Resume physique'], ['Autre physique'],imagePath: 'assets/physique.png',),
    ]),
    SemesterData('Semestre 2', [
      ModuleData('Épidémiologie',  ['QCM Épidémiologie'], ['Resume Épidémiologie'], ['Autre Épidémiologie']),
      ModuleData('Santé Sociale', ['QCM Santé Sociale'], ['Resume Santé Sociale'], ['Autre Santé Sociale']),
      ModuleData('Physiologie',['QCM Physiologie'], ['Resume Physiologie'], ['Autre Physiologie']),
      ModuleData('Embryologie',['QCM Embryologie'], ['Resume Embryologie'], ['Autre Embryologie']),
      ModuleData('Génétique', ['QCM Génétique'], ['Resume Génétique'], ['Autre Génétique']),
      ModuleData('Histologie',['QCM Histologie'], ['Resume Histologie'], ['Autre Histologie']),
      ModuleData('Anatomie',  ['QCM Anatomie'], ['Resume Anatomie'], ['Autre Anatomie']),
      ModuleData('Anglais',  ['QCM Anglais'], ['Resume Anglais'], ['Autre Anglais']),
      ModuleData('Biochimie',  ['QCM Biochimie'], ['Resume Biochimie'], ['Autre Biochimie']),
      ModuleData('Biophysique',['QCM Biophysique'], ['Resume Biophysique'], ['Autre Biophysique']),
      ModuleData('Biostatistique', ['QCM Biostatistique'], ['Resume Biostatistique'], ['Autre Biostatistique']),
      ModuleData('Chimie', ['QCM Chimie'], ['Resume Chimie'], ['Autre Chimie']),
      ModuleData('Cytologie', ['QCM Cytologie'], ['Resume Cytologie'], ['Autre Cytologie']),

    ]),
  ]),
  YearData('2 ÈME ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Anatomie dentaire', ['QCM Anatomie dentaire'], ['Resume Anatomie dentaire'], ['Autre Anatomie dentaire']),
      ModuleData('Anatomie humaine', ['QCM Anatomie humaine'], ['Resume Anatomie humaine'], ['Autre Anatomie humaine']),
      ModuleData('Microbiologie',['QCM Microbiologie'], ['Resume Microbiologie'], ['Autre Microbiologie']),
      ModuleData('Paro', ['QCM Paro'], ['Resume Paro'], ['Autre Paro']),
      ModuleData('Histologie',['QCM Histologie'], ['Resume Histologie'], ['Autre Histologie']),
      ModuleData('Informatique', ['QCM Informatique'], ['Resume Informatique'], ['Autre Informatique']),
      ModuleData('OCE', ['QCM OCE'], ['Resume OCE'], ['Autre OCE']),

    ]),
    SemesterData('Semestre 2', [
      ModuleData('Anatomie dentaire2',  ['QCM Anatomie dentaire2'], ['Resume Anatomie dentaire2'], ['Autre Anatomie dentaire2']),
      ModuleData('Anatomie humaine2', ['QCM Anatomie humaine2'], ['Resume Anatomie humaine2'], ['Autre Anatomie humaine2']),
      ModuleData('Microbiologie2', ['QCM Microbiologie2'], ['Resume Microbiologie2'], ['Autre Microbiologie2']),
      ModuleData('Pathologie', ['QCM Pathologie'], ['Resume Pathologie'], ['Autre Pathologie']),
      ModuleData('Immunologie',  ['QCM Immunologie'], ['Resume Immunologie'], ['Autre Immunologie']),
      ModuleData('OCE2', ['QCM OCE2'], ['Resume OCE2'], ['Autre OCE2']),
      ModuleData('Physiologie',['QCM Physiologie'], ['Resume Physiologie'], ['Autre Physiologie']),
      ModuleData('hygiène vention',['QCM hygiène vention'], ['Resume hygiène vention'], ['Autre hygiène vention']),
      ModuleData('Biomat Oce', ['QCM Biomat Oce'], ['Resume Biomat Oce'], ['Autre Biomat Oce']),

    ]),
  ]),
  YearData('3 ÈME ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Anapath', ['QCM Anapath'], ['Resume Anapath'], ['Autre Anapath']),
      ModuleData('Oxyologie', ['QCM Oxyologie'], ['Resume Oxyologie'], ['Autre Oxyologie']),
      ModuleData('PBD',['QCM PBD'], ['Resume PBD'], ['Autre PBD']),
      ModuleData('Prothèse', ['QCM Prothèse'], ['Resume Prothèse'], ['Autre Prothèse']),
      ModuleData('Imager..dicale', ['QCM Imager..dicale'], ['Resume Imager..dicale'], ['Autre Imager..dicale']),
      ModuleData('ODF',  ['QCM ODF'], ['Resume ODF'], ['Autre ODF']),
      ModuleData('OCE',  ['QCM OCE'], ['Resume OCE'], ['Autre OCE']),
      ModuleData('Parodo..logie',  ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
      ModuleData('Pharmacologie', ['QCM Pharmacologie'], ['Resume Pharmacologie'], ['Autre Pharmacologie']),
    ]),
    SemesterData('Semestre 2', [
      ModuleData('Anesth..logie',['QCM Anesth..logie'], ['Resume Anesth..logie'], ['Autre Anesth..logie']),
      ModuleData('Occlusodente', ['QCM Occlusodente'], ['Resume Occlusodente'], ['Autre Occlusodente']),
      ModuleData('PBD', ['QCM PBD'], ['Resume PBD'], ['Autre PBD']),
      ModuleData('Prothèse',['QCM Prothèse'], ['Resume Prothèse'], ['Autre Prothèse']),
      ModuleData('Imager..dicale',['QCM Imager..dicale'], ['Resume Imager..dicale'], ['Autre Imager..dicale']),
      ModuleData('ODF', ['QCM ODF'], ['Resume ODF'], ['Autre ODF']),
      ModuleData('OCE', ['QCM OCE'], ['Resume OCE'], ['Autre OCE']),
      ModuleData('Parodo..logie', ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
      ModuleData('Pharmacologie',['QCM Pharmacologie'], ['Resume Pharmacologie'], ['Autre Pharmacologie']),
    ]),
  ]),
  YearData('4 ÈME ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Parodo..logie', ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
    ]),
    SemesterData('Semestre 2', [
      ModuleData('Parodo..logie', ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
    ]),
  ]),
  YearData('5 ÈME ANNÉE ', [
    SemesterData('Semestre 1', [
      ModuleData('Pharmacologie', ['QCM Pharmacologie'], ['Resume Pharmacologie'], ['Autre Pharmacologie']),
    ]),
    SemesterData('Semestre 2', [
      ModuleData('Parodo..logie', ['QCM Parodo..logie'], ['Resume Parodo..logie'], ['Autre Parodo..logie']),
    ]),
  ])
];