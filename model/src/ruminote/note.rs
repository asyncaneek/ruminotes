use serde::{Deserialize, Serialize};

pub type Id = String;

#[derive(Deserialize, Serialize, PartialEq, Clone)]
pub struct Note {
    pub header: NoteId,
    #[serde(default)] // Default to empty if not present.
    pub elements: Vec<Content>,
}

#[derive(Deserialize, Serialize, PartialEq, Clone)]
pub struct NoteId {
    pub uuid : Id,
    pub title: String,
    pub create_time: u64,
    pub modified_time: u64,
}

#[derive(Serialize, Deserialize, Default, PartialEq, Clone)]
#[serde(untagged)]
pub enum Content {
    Text(String),
    #[default]
    NoValue,
}

// todo: make tests