--  https://myaccount.google.com/security
# Discorso fatto abbraccio per la presentazione oauth2 e openid
### Goals:
- far capire cosa sono e a cosa servono
    - introdurre terminologia?
- fare un esempio di utilizzo: caricamento file su google drive


Buongiorno a tutti, oggi parlerò di due protocolli, molto importanti per quanto riguarda
l'autorizzazione e gestione delle autorizzazioni fra un client e più server.

Per chi non e' a conoscienza di questi due termini, l'autenticazione è il processo
di riconoscimento di un'utente da parte del server, mentre l'autorizzazione
è il controllare se un'utente è abilitato o meno ad effettuare certe azioni.

Per fare un esempio, prendiamo google drive: Anche se non ho effettuato il login
ho ugualmente l'autorizzazione per aprire dei file pubblici. Diversamente
posso autenticarmi per utilizzare il mio account, che ha le autorizzazioni per
vedere dei file privati che sono stati condivisi con me.

Capita spesso che come programmatori, vogliamo scrivere delle applicazioni
che si integrano con servizi esterni, come ad esempio effettuare il login con
facebook e google, oppure aggiungere l'opzione di poter caricare dei file,
direttamente su google drive, utilizzando lo spazio privato di un'utente.


In questa presentazione vedremo come utilizzare i due protocolli (OAuth e OpenID)
per ottenere l'autorizzazione e pubblicare un file sul mio account di google drive.

In questo protocollo, tutto si centra sull'ottenere un token, che verrà inviato nelle richieste
ai server di google, per mostrare che siamo autorizzati.
Il procedimento per ottenere il token, varia in base alle condizioni in cui ci troviamo, quindi è importante
sapere che quello che spiegherò adesso è solamente uno dei possibili modi per ottenere il token.

--- Dimostrazione flusso di autenticazione

Faccio una carrellata veloce per mostrare il risultato finale:
Faccio partire tutto con questo tastino qua, come potete vedere, l'output di ogni
cella di codice viene riportato sotto, dove è scritto Out.
Nella seconda cella viene generato un url, che è utilizzato per richiedere all'utente
propietario dell'account, di autorizzare il mio programma ad accedere ai file del
propio spazio privato di google drive.
Quindi cliccandoci sopra ... vengo riportato alla pagina di google che mi chiede di scegliere
un'account.
Scelgo il mio personale, e qua sembra che stia ancora caricando, ma in realtà se mi
sposto nella pagina prima, posso osservare che l'esecuzione è andata avanti,
ed in questo punto, viene creato un file, contenente data ed ora attuali,
e successivamente attraverso una richiesta alle api di google drive,
viene caricato sul mio spazio.
Posso andarlo ad aprire seguendo questo link, e come possiamo vedere questo
è il file.

Benissimo, adesso scendiamo nel dettaglio di come funziona il protocollo OAuth.
Lo step iniziale, richiede di registrare l'applicazione presso il servizio che
ci fornirà il token.
In questo modo, il server riesce ad associare la specifica richiesta di autorizzazione
con la nostra applicazione.

Al momento della registrazione ci verranno forniti un client id, ed un client secret ed un client
id, che verranno utilizzati successivamente.

----- E' importante tener presente che il server che si preoccupa di creare i token e
----- gestire le autenticazioni, non necessariamente è lo stesso che fornisce
----- il servizio di autorizzazione.


Una volta ottenuti client id e client secret, possiamo creare il link che verrà utilizzato
per la richiesta di autorizzazione.

La richiesta è un url, che ha come path di base quello del server di autorizzazione che ci fornirà il
token. In aggiuntiva è necessario passare come parametri:
il client id ottenuto nel processo di registrazione
il response type, che indica il tipo di procedimento che stiamo utilizzando per
ottenere il token, nel nostro caso è "code",
il redirect uri, che indica dove verremo riportati dopo aver completato il processo di autorizzazione,
lo scope, che è l'effettiva lista di permessi che sono richiesti, e per finire 'state'
che contiene un valore arbitrario, che viene ripassato alla nostra applicazione.

Lo state può essere utilizzato per i più svariati scopi, come .....

Step successivo, una volta generato il link, ci mettiamo in ascolto, su una porta,
attendendo la rispota dal provider di autorizzazione.
Clicchiamo sul link, e come visto da prima, ci chiede di utilizzare un'account,
come al solito andrò con il mio,
e tornando sulla presentazione, si può vedere che abbiamo ricevuto
correttamente la richiesta di autorizzazione.

In questa risposta non troviamo direttamente il token da utilizzare ma un token intermedio,
chiamato authorization code, che serve per essere scambiato per il token vero e proprio.
Insieme a questo code, troviamo informazioni aggiuntive, come la lista di permessi
richiesti, e lo state.

Ricapitolando quindi, abbiamo creato la richiesta, abbiamo ricevuto un code,
ed ora dobbiamo scambiare il code per l'access token.
Questo viene fatto attraverso una richiesta POST, allo stesso server di prima,
re-inviando il code appena ricevuto, il client id, e client secret ricevuti
alla registrazione dell'applicazione.

(esegui)
la risposta da parte del server, possiamo vedere che contiene, oltre al nostro access
token, che è il token vero e propio che andremo ad utilizzare per la richiesta,
contiene anche il numero di secondi per cui rimane valido, in questo caso
per 1h, la lista di permessi a cui è autorizzato e il tipo di token.

Adesso per andarlo ad utilizzare, creo prima il contenuto del file, inserendo data e ora corrente,
poi sempre attraverso una richiesta post, aggiungo l'access token all'header authorization.
Inviando la richiesta alle api di google drive, ricevo in risposta dati aggiuntivi
legati al file che ho appena caricato, tra cui l'id che posso usare per andare a vedere il file.

Come si può ben immaginare, l'access token è utilizzabile per qualsiasi tipo di
richiesta e possiamo pensarlo come una sorta di chiave,
che garantisce l'uso delle funzionalità che sono state autorizzate dall'utente
propietario dell'account.

Oltre all'autorizzazione, questo protocollo può essere utilizzato anche per autenticare
gli utenti.
Immaginiamoci che ci vengano ritornati dei dati, che possiamo utilizzare per
identificare l'utente, come ad esempio un email, un id o un username.
Attraverso questo escamotage, noi riusciamo ad associare ad una sessione client-server
un'identità di un'utente.

Qui entra in gioco OpenID, funziona estendendo il protocollo oauth,
in pratica gli step sono esattamente gli stessi, ma nella richiesta dei permessi viene
aggiunto openid.

Grazie a questo, alla risposta in dove viene ritornato il token per l'autorizzazione,
viene aggiunto un token aggiuntivo, chiamato id token. Dove id sta per l'appunto per
identity (o identità).

Questo tipo di token è salvato in un formato particolare, che si chiama JWT, acronimo di JSON Web token.
è composto da tre parti, separate da un punto.
un header che contiene informazioni che descrivono il token, come ad esempio
che tipo di token è, quale algoritmo è stato utilizzato per crearlo eccetera.
il contenuto vero e priopio, che prende il nome di body, e contiene informazioni
base sull'identità dell'utente, come email ed un identificativo univoco che serve ad
identificare l'utente, un id, in poche parole.
E come ultima sezione si trova una firma asimmetrica, che chi non sapesse cosa sia
può pensarla come una sorta di checksum che garantisce che il token non sia
stato manomesso.
Grazie alla checksum è possibile fidarsi sempre di ciò che è contenuto dentro token,
anche nel caso estremo in cui non siamo connessi ad internet.










Questo protocollo offre enormi vantaggi, inoltre ha il vantaggio di essere
molto estensibile, come visto fin ora, è principalmente utilizzato per
l'autorizzazione, ma
con una piccola modifica è possibile utilizzarlo effettuare il login con un'
applicazione esterna come google o facebook.

-- Tirando le somme

Immaginiamoci come se, al posto dell'access token, ci venga ritornato
un gettone, contenente dei dati base dell'utente che ha approvato la richiesta.

Questo è propio quello che fa il secondo protocollo di oggi, insieme al link di
richiesta dei permessi, viene aggiunto anche il tag openid, in questo modo
viene ritornato un token aggiuntivo nella richiesta che prende il nome di id_token.

L'id token è formato da 3 parti, l'intestazione, che dà informazioni generali su
come è stato creato il token, il contenuto vero è propio,
che può contenere dati dell'utente, come ad esempio l'email, nome ed un id.
Ed una firma asimmetrica, che serve a validarlo, e confermare la sua integrità.

Per chi è a conoscienza della crittografia asimmetrica, potrà sapere che la firma
è ottenuta a partire dalle due parti precedenti, ovvero intestazione e
contenuto, quindi basta che cambi un solo carattere dei precedenti, che la
firma risulta invalidata.
La firma serve per l'appunto ad evitare che il contenuto del token venga modificato.




Questo token è firmato crittograficamente, quindi non è possibile modificarne
il contenuto.

Concludo dicendo un possibile utilizzo di questo protocollo:
È possibile delegare l'autorizzazione ed autenticazione ad un servizio esterno,
utilizzato solamente per forgiare dei token.
Successivamente, per tutti i servizi sarà possibile condividere la sessione
di login, evitando di re-inserire username e password tutte le volte.




### Note:
- spiegare gli scope
- allungare spiegazione degli step
- finire spiegazione openid


