// use std::fs;
// use std::path::Path;

// fn main() {
//   let path = Path::new("./src/resources/one_song.md");

//   let contents =
//     fs::read_to_string(path).expect("Something went wrong reading the file");

//   println!("With text:\n{}", contents);
// }

extern crate rspotify;

use rspotify::client::Spotify;
use rspotify::oauth2::SpotifyClientCredentials;
use rspotify::senum::Country;

#[tokio::main]
async fn main() {
  // Set client_id and client_secret in .env file or
  // export CLIENT_ID="your client_id"
  // export CLIENT_SECRET="secret"
  let client_credential = SpotifyClientCredentials::default().build();

  // Or set client_id and client_secret explictly
  // let client_credential = SpotifyClientCredentials::default()
  //     .client_id("this-is-my-client-id")
  //     .client_secret("this-is-my-client-secret")
  //     .build();
  let spotify = Spotify::default()
    .client_credentials_manager(client_credential)
    .build();
  let birdy_uri = "spotify:artist:2WX2uTcsvV5OnS0inACecP";
  let tracks = spotify
    .artist_top_tracks(birdy_uri, Country::UnitedStates)
    .await;
  println!("{:?}", tracks.unwrap());
}
