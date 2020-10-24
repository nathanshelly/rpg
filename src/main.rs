use std::fs;
use std::path::Path;

fn main() {
  let path = Path::new("./resources/one_song.md");

  let contents =
    fs::read_to_string(path).expect("Something went wrong reading the file");

  println!("With text:\n{}", contents);
}
