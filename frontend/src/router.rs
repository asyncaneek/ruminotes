use yew::prelude::*;
use yew_router::prelude::*;

use crate::pages;

#[derive(Clone, Routable, PartialEq)]
pub enum Route {
    #[at("/")]
    Home,
    #[at("/note_list")]
    NoteList,
}


pub fn switch(route: Route) -> Html {

    match route {
        Route::Home => html! { <pages::home::Home/> },
        Route::NoteList => html! { <pages::note_list::NoteList/> },
    }
}