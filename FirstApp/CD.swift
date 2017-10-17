//
//  CD.swift
//  FirstApp
//
//  Created by Razalon on 16/10/2017.
//  Copyright © 2017 wojgas. All rights reserved.
//

import Foundation

class CD{
    var album: String
    var artist: String
    var genre: String
    var year: Int
    var tracks: Int
    
    init(album: String, artist: String, genre: String, year: Int, tracks: Int) {
        self.album = album
        self.artist = artist
        self.genre = genre
        self.year = year
        self.tracks = tracks
    }
}
