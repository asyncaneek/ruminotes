
use crate::ruminote::note::Id;

use std::error;
use std::path;

pub type Locator = Vec<String>; // filesystem abstraction [ "C", "mission_docs", "uuid" ]

// header information about the ruminote
pub struct ArchiveMetadata
{
    pub uuid: Id,
    pub title: String,
}

pub trait Archive { // zip: ruminote itself, a filesystem equivalent ( with a manifest at the root )

    fn write_from_disk(&mut self, locator : Locator, path : &path::Path) -> Result<(), Box<dyn error::Error>>;

    fn write(&mut self, locator : Locator, contents : Vec<u8> ) -> Result<(), Box<dyn error::Error>>;

    fn rename(&mut self, source_locator: &Locator, dest_locator: Locator) -> Result<(), Box<dyn error::Error>>;

    fn remove(&mut self, locator : &Locator) -> Result<(), Box<dyn error::Error>>;

    fn retrieve(&self, locator : &Locator) -> Result<Vec<u8>, Box<dyn error::Error>>;

    fn list(&self) -> Vec<Locator>;

    fn to_mdoc(&self, path : &path::Path) -> Result<(), Box<dyn error::Error>>;
}