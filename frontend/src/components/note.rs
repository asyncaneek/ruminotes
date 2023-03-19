use yew::prelude::*;
use model::ruminote;

#[derive(Clone, PartialEq, Properties)]
pub struct NoteProps {
    pub note: ruminote::note::Note,
}

#[function_component(Note)]
pub fn note(props: &NoteProps) -> Html {
    let note = &props.note;
    html! {
        <div>
            <h2>{ &note.header.title }</h2>
        </div>
    }
}