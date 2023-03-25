use gloo::console::log;
use gloo_net::http::Request;
use yew::prelude::*;

use wasm_bindgen_futures::spawn_local;
use serde::{Deserialize, Serialize};

#[derive(Deserialize, Serialize, PartialEq, Clone)]
struct Data {
    name: String,
}

#[function_component(NoteList)]
pub fn note_list() -> Html {
    log!("note_list");
    let state = use_state_eq(|| -> Option<Result<Data, String>> { None });

    {
        let state = state.clone();
        use_effect(move || {
            spawn_local(async move {
                let response = Request::get("/api/mock_note").send().await.unwrap();

                let result = {
                    if response.ok() {
                        response
                        .text()
                        .await
                        .map_err(|err| err.to_string())
                    } else {
                        Err(format!(
                            "Error fetching data {} ({})",
                            response.status(),
                            response.status_text()
                        ))
                    }
                };

                let name = result.unwrap_or("default".to_owned());
                let data = Ok(Data{name});
                state.set(Some(data));
            });
        });
    }

    match state.as_ref() {
        None => {
            html! { <div>{"Loading..."}</div> }
        }
        Some(Ok(data)) => {
            html! {<div>{ serde_json::to_string::<String>( &data.name ).unwrap() }</div>}
        }
        Some(Err(err)) => {
            html! { <div>{"Error requesting data from server: "}{err}</div> }
        }
    }
}