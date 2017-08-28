---
title: "Wie populistisch tweeten unsere Politiker? Teil 1"
subtitle: "Eine Analyse von Tweets"
author: "Sebastian Sauer"
tags: [Populismus, textmining]
layout: post
categories: blog
---



Wir leben in einer Zeit, in der der Populismus erstarkt. Blickt man in die Türkei, in die Amerika, nach Russland - Populisten stehen an der Spitze des Staates. Man braucht kein Kenner der Geschichte des 20. Jahrhunderts zu sein, um zu wissen, wie gefährlich, falsch und drängend diese Situation ist.


# Eine Studie zum Populismus


Aber wie populistisch "sind" eigentlich die deutschen Politiker? Eine Analyse dazu kann - im besten Fall - ein schmales Schlaglicht auf einige Aspekte dieses Phänomens werfen. Sicher ist es daher sinnvoll, zurückhaltend zu argumentieren und keine übermäßige Sicherheit in den Ergebnissen vorzugeben. Aber neben dem Fehler der "Übergewissheit" gibt es auch den Fehler, auf Tatsachen zu wenig hinzuweisen und Missstände nicht anzukreiden. Entsprechend ist das Ziel der Analyse, auf der die folgenden Ergebnisse beruhen, zwar möglichst strenge Anforderungen an die Analyse zu setzen, aber trotzdem Ergebnisse aufzuzeigen auch wenn diese nur eingeschränkte Blicke auf ein breites und komplexes Phänomen zeigen.


# Datenmaterial

In dieser Analyse habe ich ca. 400.000 Tweets deutscher Politiker gesammelt und ausgewertet. Dazu kommen noch ca. 30.000 Tweets von Donald Trump, der als Vergleichsmaßstab herhalten wird (Danke, Herr Trump). Insgesamt flossen ca. 6 Millionen Wörter in diese Analyse ein. Die technischen Details sind öffentlich einsehbar bei [Github](https://github.com/sebastiansauer/polits_tweet_mining). Die Analyse ist noch nicht abgeschlossen und die Ergebnisse sind insofern vorläufig.

Die Daten (d.h. die Tweets) stammen größtenteils aus diesem Jahr (2017); aber auch ältere Tweets flossen ein. Die Daten wurden über die API von Twitter gesammelt; diese limitiert die Anzahl der (pro Zeitraum) abrufbaren Tweets, so dass es zu Einschränkungen bei der Anzahl der Tweets, die man einsammelt, kommen kann. Außerdem garantiert die API nicht, dass alle Tweets einer Person (eines Accounts) zurückgeliefert werden; ein Inhaber eines Accounts könnte sich entschließen, einen Tweet nachträglich zu löschen. In dem Fall würde dieser Tweet nicht mehr über die API geliefert werden.

![](https://sebastiansauer.github.io/psy_pol/images/2017-08-28/p_tweets_timeline2.pdf)

Nicht alle Parteien sind gleich aktiv bei Twitter. Nicht alle Accounts von Politiker fanden Eingang in diese Analyse. Tatsächlich fanden sich die meisten Accounts (und Tweets) bei der SPD.


![](https://sebastiansauer.github.io/psy_pol/images/2017-08-28/p_accounts_per_party.pdf)

![](https://sebastiansauer.github.io/psy_pol/images/2017-08-28/p_tweets_day_party_md_no_trump.png)


# Twitter-Accounts

Um Twitter-Accounts von deutschen Politikern zu bekommen, habe ich mich an diese Listen gehalten:

- [Liste](https://twitter.com/dw_politics/lists/german-politicians/members) "German Politicians" der [Deutschen Welle](http://www.dw.com/de/unternehmen/profil/s-30626)
- Twitter-Accounts des [Bundesvorstands der AfD](https://www.afd.de/partei/bundesvorstand/)
- Twitter-Accounts des [Präsidiuums der FDP](https://www.fdp.de/seite/praesidium)

Außerdem habe ich die meisten Tweets von Donald Trump aufgenommen. Ach ja, Markus Söder hat es auch noch geschafft. Etwas willkürlich, zugegeben, aber mir viel auf, dass er nicht in den Listen oben enthalten war, obwohl er twittert.

Dass Donald Trump twittert wie verrückt, ist allgemein bekannt. Tatsächlich spiegelt sich das in den Daten wider.

![](https://sebastiansauer.github.io/psy_pol/images/2017-08-28/p_tweets_day_party_md_no_trump.png)


Insgesamt wurden ca. 200 Accounts berücksichtigt. Es wurden nicht alle zur Bundestagswahl zugelassenen Parteien berücksichtigt, sondern nur diese allseits bekannten:

- CDU
- CSU
- SPD
- Grüne
- Linke
- FDP
- AfD
- (Trump)

# Forschungsfrage

Zentrale Frage dieser Analyse ist: Wie populistisch twittert welche Partei? Davon abgeleitet: Welche Partei zeigt den meisten Populismus in der Art, wie ihre (führenden) Vertreter twittern? Wie ähnlich sind die deutschen Parteien in dieser Hinsicht zu Trump?

# Twitter als Daten-Fundgrube

Twitter bietet sich als Datenfundgrube an, da die Tweets öffentlich verfügbar sind und das in recht großer Masse. Natürlich ist diese Stichprobe keineswegs perfekt: Twitter ist kein repräsentativer Schnitt durch die Kommunikationslandschaft der Politik. Tweets sind auch nicht typisch für die Art, wie wir sprechen. Aber auf der anderen Seite ist es eben der vielleicht größte Datenschatz an öffentlicher Kommunikation.


# Definition von Populismus

Die Definition von Populismus, die hier Pate steht, beruht auf Karl Poppers Idee von der Stammesgesellschaft, wie er es in seinem Buch "Die offene Gesellschaft und ihre Feinde darstellt". In [diesem Post](https://sebastiansauer.github.io/psy_pol/blog/Urhorde/) habe ich diese Idee kürzlich versucht darzustellen.

Konkret lief es auf folgende acht Indikatoren von Populismus hinaus, die dann zu einem Wert zusammengefasst werden:

- "Wortkürze"
- "Verhältnis negativer/positiver Wörter",
- "Anteil negativer Wörter",
- "Anteil emotionaler Wörter",
- "Wert an negativer Emotion",
- "Wert an Emotionalität",
- "Anteil GROSSBUCHSTABEN",
- "Verhältnis von Adjektiven zu Adverben"


Diese Indikatoren beruhen auf Häufigkeiten oder Mediane, je nach dem welche Statistik am besten passte. Dann wurde der Wert einer Person umgerechnet in einen Prozentrang (genauer: z-Wert) im Feld aller Accounts.

# Populismus-Werte nach Parteien

Fasst man also die acht Populismus-Indikatoren zu einem "Populismuswert" zusammen, lässt sich ein Wert pro Partei ableiten.


![](https://sebastiansauer.github.io/psy_pol/images/2017-08-28/p_party_pop_scores_2.png)



Wie man sieht, führt Trump deutlich hinsichtlich Populismus (wie in dieser Studie analysiert). Danach kommt die AfD, kurz danach die Linke. Interessanterweise sind die großen Volksparteien (CDU, CSU, SPD) am anderen Ende des Spektrums angesiedelt, also viel weniger populistisch.


# Fazit: Trump führt, AfD folgt

Dieser erste Einblick in eine recht umfassende Analyse (mehr Ergebnisse folgen) bestätigt den allgemeinen Eindruck, dass Trump sehr populistisch ist und dass die AfD die vielleicht populistischste deutsche Partei ist. Natürlich: die Ergebnisse sollten noch deutlich genauer im Detail betrachtet werden und im Fachpublikum diskutiert werden (das wird z.B. im Rahmen [dieser Konferenz](http://aow2017.de/) passieren).

# Cave

Es ist auch klar, dass bei der Analyse eines komplexen Datenmaterials es zwangsläufig viele Entscheidungen gibt, die die Ergebnisse beeinflussen können. Ein Beispiel: Soll die "mittlere" Anzahl von Tweets auf dem Median oder dem Mittelwert beruhen? (Hier wurde immer der Median gewählt). Fragen solcher Art gibt es einige; es ist nicht ganz klar, wie sehr diese Entscheidungen die Ergebnisse dieser Studie (oder ähnlicher) beeinflussen.

Mehr Ergebnisse folgen später. Fachleute sind herzlich eingeladen, mit dem Code bei  [Github](https://github.com/sebastiansauer/polits_tweet_mining) weiterzuarbeiten. Diskussion ist willkommen.
