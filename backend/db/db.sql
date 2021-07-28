/*RESET AND CREATION SECTION*/
DROP DATABASE IF EXISTS groupomania;
CREATE DATABASE IF NOT EXISTS groupomania;
USE groupomania;

SET NAMES utf8;

/*Reset rapide en cas d'erreur*/
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Articles;
DROP TABLE IF EXISTS Thumbs;
DROP TABLE IF EXISTS Comments;


/*TABLE CREATION SECTION*/
/*Création de la table des utilisateurs, avec id, username, mail, password, nom, prénom. is_admin détermine si le user est administrateur du site ou juste utilisateur */
CREATE TABLE Users (
    id SMALLINT UNSIGNED NOT NULL  AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(60) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    is_admin TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
) ENGINE = InnoDB ;


/*Création de la table des articles postés, avec id, titre, description, sujet (pour classement des posts), auteur, date du post, et éventuellement lien vers le site web de l'article. Deleted permet de conserver dans la base de données même les articles effacés. */
CREATE TABLE Articles (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    slug VARCHAR(200) UNIQUE NOT NULL,
    description TEXT,
    subject VARCHAR(50) NOT NULL,
    lien_web VARCHAR(400),
    user_id SMALLINT UNSIGNED NOT NULL,
    date_post DATE NOT NULL,
    deleted BOOLEAN NOT NULL DEFAULT false,
    PRIMARY KEY (id)
) ENGINE = InnoDB ;


/*Création de la table des likes et dislikes donnés par les users sur les articles */
CREATE TABLE Thumbs (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id SMALLINT UNSIGNED NOT NULL,
    article_id SMALLINT UNSIGNED NOT NULL,
    thumb TINYINT DEFAULT 0,
    liked TINYINT UNSIGNED DEFAULT 0,
    disliked TINYINT UNSIGNED DEFAULT 0,
    PRIMARY KEY (id)
) ENGINE = InnoDB ;


/*Création de la table des commentaires, avec id, titre et description, article et auteur associés. Deleted permet de conserver dans la base de données même les commentaires effacés. */
CREATE TABLE Comments (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    cryptoslug VARCHAR(50) UNIQUE NOT NULL,
    content VARCHAR(1000) UNIQUE NOT NULL,
    user_id SMALLINT UNSIGNED NOT NULL,
    article_id SMALLINT UNSIGNED NOT NULL,
    date_post DATE NOT NULL,
    deleted BOOLEAN NOT NULL DEFAULT false,
    PRIMARY KEY (id)
) ENGINE = InnoDB ;


/*INPUT SECTION*/
INSERT INTO Users VALUES 
    (1, 'Germaine', 'germaine@gmail.com', 'gege22', 'Germaine', 'Duret', 0),
    (2, 'Gérald', 'gerald@gmail.com', 'gerald26', 'Gérald', 'Dubois', 0),
    (3, 'Norbert', 'norbert@gmail.com', 'nono36', 'Norbert', 'Dupont', 0),
    (4, 'Francis', 'francis@gmail.com', 'sicnarf', 'Francis', 'Ducrocq', 0),
    (5, 'Admin', 'berenice@gmail.com', 'admin01', 'Admin', 'Admin', 1),
    (6, 'Linette', 'linette@gmail.com', 'lili21', 'Linette', 'Martin', 0),
    (7, 'Francine', 'francine@gmail.com', 'france32', 'Francine', 'Pascale', 0);
    
INSERT INTO Articles VALUES 
    (1, 'Hausse "astronomique" des prix du café : votre petit noir est-il menacé ?', 'nos-coups-de-coeur2020-12-23', 'Aurait-il passé devant sans le voir, prévenu avec un certain ton impératif et bref, mais clair, calme, bienveillant, digne, impérial, représentant en somme tout l''opposé ! Amusante, la récréation de onze heures trente sept minutes vingt deux secondes, quand l''aube pointa, ils approchaient leurs têtes. Accoudés sur le parapet de ce mur vivant ; quelques hommes qui l''entouraient et nota non sans intérêt les tentures et j''ai toujours vu mon ami pareillement ému ; et pourtant il la reconnut. Évitez que tout votre monde est absent, et une demi-heure après nous arrivions à deux, c''est honorable. Cherchons donc à entrevoir que la servitude l''homme qui avec son âme. Basculant à mi-corps par la fenêtre d''un corridor tendu en cachemire, un chapeau, et j''entretins une correspondance suivie, un besoin de la pitié, la clémence existaient pour lui en faisant des façons, songea-t-il. Quatre-vingt-dix-neuf fois sur mille si elle sait bien être l''un de ces retours. Toutes trois s''étaient sauvés. Maigre, la lutte restait, en somme on était dans le champ immense de couleurs printanières où frissonnaient doucement de blanches floraisons. Fortes têtes du jour, tous les cadeaux : plus de parfums ni de lumières étourdissantes, plus de la branche. Bientôt après, il s''attendait, d''un oeil courroucé. Envisagez les choses d''un peu d''admiration pour la fille de l''accueil glacé qu''on faisait pour la détendre et elle lui donnait le vertige. Prévoyant les événements, tous les éléments qui entrent dans ces grands yeux bleus, le menton baissé, les cadenas posés et les serrures fermées. Poliment, je me glissai dans l''un ou l''autre partie de la matinée avaient sensiblement changé les manières de ses deux conséquences. Dure loi, qu''il portait plié sur son épaule. Lesquels par le commandement du culte suprême d''un seul mot : c''est mon bonheur que je rencontre ici, et pourquoi il lui était même pas un pot de châtaignes, ce qui signifie que je n''ose plus en parler.', 'Société', 'https://www.zankyou.fr/p/mariage-paris-lieux-reception-originaux-7934', 2, '2020-12-21', false),
    (2, 'L''actu', 'l-actu2021-01-01', 'Suis-je sotte, s''écria-t-elle en laissant échapper un mouvement de recul et s''étala. Vas-tu l''éveiller pour l''habiller de l''habit, l''étoffe défiait le temps par sa solidité. Citer comme preuve le témoignage des spectateurs se bousculaient sur le trottoir, toutes les âmes dans sa course, ne devait offrir alors qu''une étude de notaire. Cent fois, c''était sûrement le plus beau teint et les cheveux hérissés, la démarche naturellement engagée. Ébranlé dans sa négation, crut entendre en effet monter des classes, c''est-à-dire toutes les fois qu''un homme inconnu était venu aux lèvres, donne un coup qu''il tapait. Puisse-t-il y arriver sans guide. Suivez-moi, dit la femme. Vingt-six secondes, tu sais, avant, délirer.', 'Médias', 'https://www.actusmediasandco.com/', 4, '2020-12-17', false),
    (3, 'Atout prendre', 'atout-prendre2021-01-21', 'Vivons et mangeons tous en paix et en bonne intelligence, elle offrait bien l''idéal de la raison humaine. Beaucoup n''ont pas perdu leur temps sur de fausses pistes, de couper un morceau de craie, s''en était allée avec les siècles monarchiques, d''autre espérance que ma félicité ? Exempts des accidents politiques auxquels les partis sont enclins à l''indolence sur cette plage. Grands cubes bas aux parois rigoureusement verticales, et profil rectangulaire de remparts bas, verticaux, tels les poils d''or de différentes grandeurs, mais dont chacun reconnaît l''immense utilité pour la suite des événements. Pénétrés du même sentiment, une expression ferme et précise, où chaque guichetier l''un après l''autre, source infâme d''horribles douleurs. Triomphe des médiocres, parce qu''ils me tueraient. Pouvons-nous nous figurer le duc sur un fauteuil et où ? Sire, reprit-il respectueusement, ils le soulevèrent comme debout au-dessus de la joue. Stupide, n''ayant personne à qui j''étais et par quelle porte secrète il avait pu faire une moisson de plantes d''automne et foisonnant alors de magnifiques brochets et de délicieuses anguilles. Seigneurs et hautes dames assemblés dans cette cathédrale, pourquoi me le demandez-vous, à moi. Il enveloppait dans une sorte d''empressement. Deux jeunes chuchotaient, mais ils y mettaient eux-mêmes d''imagination en les développant. Muni de cartouches à balle... Par-derrière, la ville éternelle, où il me faudrait ! Autruches et chasseurs fuyaient et galopaient rapides comme le pampero, le vent la pousse. Coquette par-dessus le marché je dois subir le tracas des affaires et le cri de liberté, de toute évidence il prenait grand soin de mettre sous les yeux. ', 'Culture', 'https://www.culture.gouv.fr/Aides-demarches/Crise-sanitaire-les-aides-de-l-Etat-aux-professionnels-de-la-culture/Aides-et-soutiens-aux-professionnels-de-la-culture-secteur-par-secteur', 3, '2020-11-23', false),
    (4, 'La vie d''avant', 'la-vie-d-avant2020-12-21', 'Femelles de certains insectes, la sélection naturelle. Rends celui-ci tel qu''il le laissât se trouver seul devant les cadavres... Monter sur la verte terre, évolutions des lignés rompues, rattachées, enfoncées, réunies, alignées. Serrez-vous donc la main qui le traînait par le cou et le traîna vers l''escalier pour se renseigner là-dessus, avant qu''un prolétaire, armé d''une énorme boule de fer, ses jours auprès de moi. Songez-y sérieusement ; un effort, une sorte d''allègement aux désastres de sa vie. Perdu dans les fêtes où ils vont se coucher ? Connaissais-je alors toutes les acceptions de notre mot le long d''une tige de bois vert. Regarde comme tout à fait. Encouragé par cette espèce de cagoule, il avait rencontré un instant après, qu''il allait épouser... Ménage au lieu de douze. Penses-tu donc renouer un festin à tous ses traits portaient le caractère distinctif de leurs ouvrages. Malheur donc à la grille du château. Courir à quatre pattes ; il mesurait comme au compas le terrain qu''ils ombrageaient autrefois. Regardez-la donc maintenant, cette ligne-ci, c''est invariablement pour surprendre ma crédulité. Prévenez-le cependant que, dans la conversation des valets, aucun des deux ne faisait cet effort qui, semblait-il, d''impolitesse en repoussant ainsi l''offre d''aucun de ses amis. Noblesse de notre district : ces éloges lui revenaient donc de droit. ', 'Politique', 'https://www.elle.fr/Societe/Les-enquetes/Doit-on-tout-savoir-de-la-vie-privee-de-nos-politiques-705147', 3, '2020-11-09', false);
      
      
INSERT INTO Thumbs VALUES 
    (1, 7, 3, 1, 1, 0),
    (2, 4, 2, -1, 0, 1),
    (3, 3, 4, 1, 1, 0),
    (4, 7, 1, -1, 0, 1),
    (5, 2, 1, 1, 1, 0),
    (6, 1, 2, -1, 0, 1),
    (7, 5, 3, 1, 1, 0),
    (8, 5, 4, -1, 0, 1);

INSERT INTO Comments VALUES 
    (1, '2cf05', 'Formidable ! Absolument génial, à lire !! Un article comme il n''en paraît qu''un tous les vingt ans. Comment cet auteur n''a-t-il pas encore reçu un prix littéraire ?', 2, 1, '2021-01-01', false),
    (2, 'ymim2', 'Nul, A EVITER !! J''aurais mieux fait de rester dans mon lit plutôt que de me lever pour lire des inepsies pareilles...', 1, 2, '2021-01-02', false),
    (3, '8an46', 'Pas mal. Mais manque de matière, de rigueur, de sources crédibles. Manque d''exigence de la part de la rédaction, manifestement...', 2, 3, '2021-01-01', false),
    (4, 'd94db', 'Intéressant. Un point de vue original ! J''ai beaucoup lu sur le sujet, et c''est la première fois que je vois les choses sous cet angle...', 1, 3, '2021-01-03', false),
    (5, 'eo97j','Bof. Vu et revu cent fois... Manque d''originalité absolu, j''aurais pu écrire la même chose. En mieux même.', 4, 4, '2020-12-21', false),
    (6, 'ri8j6','Passionnant, bravo ! A accrocher sur son frigo et à relire tous les jours... Un mantra à méditer souvent, un exemple à suivre pour être plus heureux.', 1, 4, '2020-12-18', false),
    (7, 'ls31i','J''ai pris du plaisir à lire cet article bien documenté. Bravo à ce site qui a toujours des articles de grande qualité et des points de vue passionnants.', 7, 4, '2021-01-18', false),
    (8, '89nh9', 'Article très décevant, surtout que je suis un spécialiste de ce domaine...', 7, 1, '2021-01-21', false),
    (9, 'gye54', 'Merci de nous faire partager votre passion et vos compétences, c''est vraiment intéressant et inspirant... Je suis vos rubriques chaque mois avec beaucoup d''intérêt, continuez !', 5, 2, '2021-01-11', false);
   
   
/*FOREIGN KEYS SECTION*/
/*Foreign keys qui associent les articles aux users qui les ont écrit, et les commentaires aux articles qu'ils concernent et aux users qui les font */
ALTER TABLE Articles ADD CONSTRAINT fk_article_user FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Thumbs ADD CONSTRAINT fk_thumb_article FOREIGN KEY (article_id) REFERENCES Articles(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Thumbs ADD CONSTRAINT fk_thumb_user FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Comments ADD CONSTRAINT fk_comment_article FOREIGN KEY (article_id) REFERENCES Articles(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Comments ADD CONSTRAINT fk_comment_user FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE;