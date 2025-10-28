# JARVIS
Repository del progetto inerente il corso di "Ingegneria del Software" (UniFe) A.A. 2023/2024
## Il team J.A.R.V.I.S.
* [@svevaturola](https://github.com/svevaturola) - Architetto 
* [@giuliamasina](https://github.com/giuliamasina) - Analista 
* [@saravaresco](https://github.com/saravaresco) - Quality Assurance 
* [@Marco-178](https://github.com/Marco-178) - Frontend/UX-UI
* [@lucadomene](https://github.com/lucadomene) - Backend/UX-UI

## Funzionamento di prova
### Avvio dell'applicativo
L'applicativo è composto da 4 componenti base che, dialogando tra di loro, erogano un servizio di gestione della logistica per eventi.
Tali componenti sono:
* Database (MySQL)
* Mock API (Mockoon)
* Backend (SpringBoot)
* Frontend (VueJS)

Affinché risultasse semplice effettuare il deployment dei quattro suddetti componenti, sono stati incapsulati in altrettanti container correlati dal file `docker-compose.yaml`.

Mediante il comando
```sh
sudo docker compose up
```
è possibile avviare i componenti.
**È importante che tale comando venga effettuato nel direttorio contenente il file `docker-compose.yaml`.**

L'accesso all'interfaccia di frontend è fruibile da `localhost:80`
