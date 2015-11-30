<!--
# BibApp
-->
<img src="screen-hand.jpg" style='height:26rem;float:left'><h1 style=clear:none>BibApp</h1><h2 style=clear:none>- inspirationsværktøj</h2>

BibApp er et inspirationsværktøj, der hjælper brugeren med at finde relaterede bøger. 
Princippet er, at der er nogle bøger i forgrunden, og disse er grundlag for hvilke bøger der bliver vist i baggrunden. 
En bog kan trækkes fra baggrund til forgrund, hvorefter der vil komme ny bøger i baggrunden.


Den opfylder bedømmelseskriterierne:

- *Realiserbar:* kørende prototype er realiseret
- *Værdiskabende for biblioteker og biblioteksbrugere:* hjælper med at finde relaterede bøger, og inspirerer, hvilket et område hvor der mangler digitale redskaber.
- *Brugervenlig og visuelt appellerende:* interaktionen er designet til at være enkel og let at bruge, baseret på brugerfeedback. Kommentarer fra brugertest er: "den er cool", "Charmerende, lettilgængelig, overskuelig vej til informationer", "begejstringen over det visuelt flotte".
- *Bruger kulturdata:* bygger på DBCs bibliografiske data, ADHL-datasæt, samt bogforsider. Den beriger desuden ADHL-data gennem anbefalingsservice og eigenvektoranalyse.
- *Er på dansk:* ja.
- *Kan bruges efter konkurrencen:* prototypen skal poleres før den er produktionsklar, men den er enkel at udvide så den, udover at distribures som mobilapp, også kan optimeres til tablets og bibliotekernes touch-infoskærme, og indlejres som widget i DDB-CMS og bibliotek.dk

TODO De følgende sider går mere i detaljer med: formål, kørende prototype, 
Baggrund, kørende prototype, brugerstudier, data, og næste trin mod at få den i produktion.


<div style=page-break-before:always></div>

<img src="screen4x.jpg" style='width:100%'>

<!-- 
# Formål og prototype  
-->
TODO: omskriv sætning til at starte med fremhævet

*Formålet* er at skabe et redskab til at gå på opdagelse i bibliotekets materialer:

- Ifølge bibliotekarer er der et uopfyldt behov for digitale inspirationsværktøj.
- Biblioteksbrugere melder ud, at de gerne vil finde lignende bøger, eksempelvis romaner inden for samme "genre".
- Konkret har jeg den personlige use-case, at jeg gerne vil finde gode bøger at læse højt for min søn.

Derfor har jeg en lavet *app-prototype*, der kommer med automatiske anbefalinger og inspiration, ud fra valgte bøger. Dette ses herover:

- "Turen går til..." inspirerer til "Lonely Planet" og lignende rejseguider
- "Pippi Langstrømpe" inspirerer til "Cirkeline", "Mumitroldende", "Alfons Åberg", "Emil fra Lønneberg", "Rasmus Klump", "Peter Pedal", "Babapappa", "Hodja fra Pjort",  og andre højtlæsningsbøger
- "HTML5" inspirerer udover CSS og webdesign også til mobiludvikling, Python, PHP og Drupal, etc.
- Visning af materialer indeholder beskrivelse, forside, og direkte link til bestilling og selve materialet på bibliotek.dk


Prototypen er designet i mobiltelefon-format, og *kan prøves* i webbrowsere, installeres som app på Android-telefoner, - og som web-app på iPhone ved valg af "Add to Home Screen"/"Føj til hjemmeskærm". Da det er en tidlig prototype, er den langsom og virker ikke på alle modeller, men den grundlæggende interaktion og visualisering er virker.

- Webapp: <a href=http://solsort.com/apps/bibapp/>solsort.com/apps/bibapp/</a>
- Android app(unsigned): <a href=http://solsort.com/apps/bibapp/bibapp.apk>solsort.com/apps/bibapp/bibapp.apk</a>


<div style=page-break-before:always></div>

# Interaktion og grænseflade

<img class=im src=screen1.jpg> <img class=im src=screen2.jpg>  <br><br>
Materialevisningen giver overblik med forsider, og klik på element viser overlay med materialeinfo.

Her ser vi et klik på en bog i baggrunden, hvorefter mere info kommer frem.

<div style="clear:both"></div>

<img class=im src=screen3.jpg> <img class=im src=screen4.jpg> <br><br>
Elementer kan trækkes fra baggrund til forgrund, hvorefter der kommer nye relaterede materialer.

Her ser vi "Otto er et næsehorn" blive trukket fra baggrund til forgrund, hvorefter Hakkebakkeskoven, Gummi-Tarzan, etc., dukker op som nye anbefalinger i baggrunden.

<div style="clear:both"></div>

Visningen gør stor brug af forsider, hvilket gør det visuelt inspirerende. 
Interaktionen er at trække i materialer, hvilket er naturligt på touch-devices.
Dette bygger på erfaringer fra "Visualisering af relationer"-DDB-CMS-widget.

Det nuværende layout er resultatet af brugerstudier og feedback på de første udgaver af prototypen.


<div style=page-break-before:always></div>

# Data

Datakilder som er brugt under app-udviklingen er: 1) ADHL og biblio&shy;grafiske data fra DBCs hjemmeside. 2) Links til forsidebilleder fra bogpriser.dk. <br>3) Jsonp-enabled DDB-CMS api ovenpå brønden via dev.vejlebib.dk.

De bibliografiske poster har jeg beriget med anbefalinger og en vektor der kan bruges til afstandsmål mellem materialer. Begge dele er udregnet fra ADHL-datasættet:

*Anbefalingerne* svarer til ADHL-servicen tilføjet en vægtning, som korrigerer for at populære materialer ikke bliver overrepræsenteret. Dette giver bedre og mere relevante resultater.

*Afstandsmål* mellem materialer skabes ved at materialerne projiceres ind i det rum som de (200) mest betydende ADHL-eigenvektorer udspænder. Det kan bruges blandt andet bruges til: at finde materialer der ligger imellem andre materialer, at lave klyngeanalyse af materialer, og at bestemme placering af materialer ved visualisering. På grund af tidsbegrænsning er ikke kommet med i prototypen endnu, men det har spændende perspektiver.

# Teknik

Prototypen er udviklet i HTML5 ovenpå react/reagent/re-frame i ClojureScript. 
<br><span style="font-size:75%">`github.com/rasmuserik/solsort-util/blob/master/src/solsort/apps/bib.cljs`</span>
<br> Databehandling bruger Python, LevelDB og Gensim. 
<br><span style="font-size:75%">`github.com/rasmuserik/bib-data`
</span>
<br> Søgemaskine og online database kører via ElasticSearch og CouchDB.
<br> Mobilapp via Apache Cordova. 
<span style="font-size:75%">`github.com/rasmuserik/bibapp-cordova`</span>

TODO tech-logo-illustration

<div style=page-break-before:always></div>

# Videreudvikling - næste trin


TODO Hvis jeg får lejlighed til at bygge videre på app'en og gøre den produktions&shy;klar, så vil følgende ting kunne gøre den endnu bedre:

<table style="width:100%; font-size: 1.3rem"><tr><td width=48% valign=top>

Autogenerede forsider ud fra metadata for de materialer som ikke har forsider.

Bedre anbefalingerne baseret på flere forgrunds&shy;elementer, i stedet for kun det allernærmeste.
Eksempelvis ved at interpolere baggrunds&shy;elementernes koordinater i eigenvektor&shy;rummet og bruge disse til at finde biblioteksmaterialet. Dette forud&shy;sætter udvikling af webservice for søgning i eigen&shy;vektor&shy;rummet.

Performanceoptimering af klienten. Den nuværende udgave er uoptimeret, hvilket er mærkbart.

Produktionswebservices hos DBC, frem for diverse hacks. Dette kræver CORS-understøttelse og diverse andre forbedringer af webservices.

Udvid afstandsmålet mellem materialer til ikke kun at være baseret på ADHL. Eigenvektor&shy;analyse af metadata er naturligt at tilføje.

Flere brugerstudier, og videreudvikling af app ud fra disse.

</td><td width=4%>&nbsp;</td><td width=48% valign=top>

Layout for tablets, touch-storskærme og widgets. Løses bedst ved dynamisk udregnet layout.

Eventuelt indlejring som inspirations&shy;værktøj i bibliotek.dk og DDB-CMS.

Deploy og publicér på app-markeder for Android og iOS, samt evt. Windows Phone, Amazon, og FirefoxOS.

Animationer i brugergrænsfladen vil gøre den endnu mere intuitiv: det vil gøre det tydeligere, at man kan trække elemen&shy;terne, og hvad der sker når man søger, bytter om på forgrundselementer, etc.

Konfigurerbar anbefalings-præcisionen.

Mulighed for at gemme materialer.

Bulk-webservices for performance. Der er mange http-forespørgsler, hvilket er en flaskehals i performance. Dette kan forbedres med webservice der giver info om flere elementer.

Tydeligere feedback ved søgning.

</tr></table>

TODO konklusion/call-to-action

TODO solsort-logo
