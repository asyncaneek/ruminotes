use yew::prelude::*;

use crate::components::note_list::NoteList;

#[function_component(Home)]
pub fn home() -> Html {
    html! {<NoteList/>}
}
