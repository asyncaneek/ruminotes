use yew::prelude::*;
use yew_router::prelude::*;

use crate::router::Route;

#[function_component(Home)]
pub fn home() -> Html {
    html! {
      <div>
        <h1>{"Home"}</h1>
        <li>
          <Link<Route> to={Route::NoteList}>{ "Note List" }</Link<Route>>
        </li>
      </div>
    }
}
