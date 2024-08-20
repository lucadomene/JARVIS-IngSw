<script setup lang="ts">
  import axios from 'axios';
  import type {AxiosResponse} from 'axios';
  import {onMounted, ref, watch} from 'vue';
  import {Venue, Booking, Personnel, EventInfo, User} from '@/types'
  import {storeToRefs} from "pinia";
  import {useVenuesStore} from '@/stores/venuesStore';
  import {useBookingStore} from '@/stores/bookingsStore';
  import {usePersonnelStore} from '@/stores/personnelStore';
  import {useEventStore} from '@/stores/eventStore';
  import {useUserStore} from '@/stores/userStore';

  const venuesStore = useVenuesStore();
  const bookingStore = useBookingStore();
  const personnelStore = usePersonnelStore();
  const eventStore = useEventStore();
  const userStore = useUserStore();

  const {dataVenue} = storeToRefs(venuesStore);
  const {isDataVenueLoaded} = storeToRefs(venuesStore);
  const {dataBooking} = storeToRefs(bookingStore);
  const {isDataBookingLoaded} = storeToRefs(bookingStore);
  const {dataPersonnel} = storeToRefs(personnelStore);
  const {isDataPersonnelLoaded} = storeToRefs(personnelStore);
  const {dataEventInfo} = storeToRefs(eventStore);
  const {dataUser} = storeToRefs(userStore);

  const popupTitle = ref<string>("placeholder title");
  const popupMessage = ref<string>("placeholder message");

  const modal = ref<HTMLDialogElement | null>(null);

  function useDialog(title:string, message:string) {
    popupTitle.value = title;
    popupMessage.value = message;
    modal.value!.showModal();
  }

  function closeDialog(){
    modal.value!.close();
  }

  onMounted(async () => {
    await fetchEventInfo();
    await fetchUser();
    await fetchVenues();
    await fetchBookings();
    await fetchPersonnel();
  });

  async function fetchEventInfo(){
    await axios.get<EventInfo>("/api/callREST/getEvent").then((response: AxiosResponse<EventInfo>) => {
      console.log("Risposta da Axios:", response);
      console.log("Evento ricevuto:", response.data);
      if('event_type' in response.data){
        dataEventInfo.value = response.data;
      } else {
        console.log("Unknown Object", response.data)
      }
    }).catch(error => {
      console.error("Errore durante la richiesta Axios:", error);
    });
  }

  async function fetchUser(){
    await axios.get<User>("/api/callREST/getUser").then((response: AxiosResponse<User>) => {
      console.log("Risposta da Axios:", response);
      console.log("Utente ricevuto:", response.data);
      const codice_fiscale = response.data.codice_fiscale;
      dataUser.value = new User(codice_fiscale);
    }).catch(error => {
      console.error("Errore durante la richiesta Axios:", error);
    });
  }

  async function fetchBookings(){
    if(dataUser.value != null) {
      await axios.get<Booking[]>("api/booking/ls?cf=" + dataUser.value.codice_fiscale).then((response: AxiosResponse<Booking[]>) => { // un po' lento
        console.log("Risposta da Axios: ", response);
        console.log("Prenotazioni ricevute: ", response.data);
        response.data.forEach(item => {
          if ('id' in item) {
            const newBooking = new Booking(item.id, item.codice_fiscale, item.date, item.duration, item.venue, item.personnel);
            dataBooking.value.push(newBooking);
          } else {
            console.log("Unknown Object", response.data);
          }
        });
      }).catch(error => {
        console.error("Errore durante la richiesta Axios: ", error);
      });
      isDataBookingLoaded.value = true;
    }
    else{
      console.error("Lettura prenotazioni di utente non specificato")
    }
  }

  watch(() => bookingStore.updateBookingsTrigger,
      async () => {
        if(bookingStore.updateBookingsTrigger) {
          try {
            venuesStore.setVenues([]);
            await fetchVenues();
            bookingStore.notifyBookingsUpdated();
          } catch (error) {
            console.error("Errore durante l'aggiornamento:", error);
          }
        }
      }
  );

  async function fetchVenues(){
    await axios.get<Venue[]>("/api/venue/available?date=" + dataEventInfo.value.date + "&start=" + dataEventInfo.value.schedule_start + "&end=" + dataEventInfo.value.schedule_end + "&capacity=" + dataEventInfo.value.max_participants).then((response: AxiosResponse<Venue[]>) => {
      console.log("Risposta da Axios: ", response);
      console.log("Luoghi ricevuti: ", response.data);
      response.data.forEach(item => {
        if ('address' in item) {
          const newVenue = new Venue(item.id, item.name, item.address, item.max_capacity, item.rent_cost, item.weekdayHours, item.weekendHours, item.closingDays, item.booking);
          dataVenue.value.push(newVenue);
        } else {
          console.log("Unknown Object", response.data);
        }
      });
      isDataVenueLoaded.value = true;
    }).catch(error => {
      console.error("Errore durante la richiesta Axios: ", error);
      useDialog("Errore!", "Errore durante il caricamento dei luoghi. Riprovare più tardi o aggiornare la pagina.");
    });
  }

  async function fetchPersonnel(){
    let url = "/api/personnel/available?sectors=" + dataEventInfo.value.event_type + "&date=" + dataEventInfo.value.date + "&start=" + dataEventInfo.value.schedule_start + "&end=" + dataEventInfo.value.schedule_end;
    try{
      const response: AxiosResponse<Personnel[]> = await axios.get<Personnel[]>(url);
      console.log("Risposta da Axios: ", response);
      console.log("Personale ricevuti: ", response.data);
      response.data.forEach(item => {
        if ('sector' in item) {
          const newPersonnel = new Personnel(item.name, item.hourly_cost, item.weekdayHours, item.weekendHours, item.sector);
          dataPersonnel.value.push(newPersonnel);
          console.log("Personnel", dataPersonnel.value);
        } else {
          console.log("Unknown Object", response.data);
        }
      });
      isDataPersonnelLoaded.value = true;
    } catch(error) {
      console.error("Errore durante la richiesta Axios: ", error);
    }
  }
</script>

<template>
  <dialog ref="modal" id="modal">
    <h2>{{popupTitle}}</h2>
    <p>{{popupMessage}}</p>
    <button class="button" id="close-button" @click="closeDialog">Chiudi</button>
  </dialog>
</template>
