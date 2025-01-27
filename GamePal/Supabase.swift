//
//  Supabase.swift
//  GamePal
//
//  Created by Devin Cassella on 1/24/25.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://xyxthaywnksvlwpqlhhk.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5eHRoYXl3bmtzdmx3cHFsaGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY5NzA4NDUsImV4cCI6MjA1MjU0Njg0NX0.8IIcJv6DV2w3hm8Sr5P-WxKE_mw9-Nf-Wj2O-CFh05k"
)
