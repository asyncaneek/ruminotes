use crate::ruminote::archive::{Archive,ArchiveMetadata};
use crate::ruminote::note;

use std::error;
use std::path;

pub trait Persistence { // storage: holds the of mdocs

    fn create(&mut self) -> Result<ArchiveMetadata, Box<dyn error::Error>>;

    fn remove(&mut self, note_id : &note::Id) -> Result<(), Box<dyn error::Error>>;

    fn list(&self) -> Vec<ArchiveMetadata>;

    fn retrieve(&self, note_id : &note::Id) -> Result<Box<dyn Archive>, Box<dyn error::Error>>;

    // fails when no manifest at root
    // fails when file doesn't exist/ no access or corrupt
    // fails when zip file is formatted wrong
    // todo! how is a conflicting uuid handled ?
    fn from_mdoc(&self, path_to_zip : &path::Path ) -> Result<ArchiveMetadata, Box<dyn error::Error>>;
}