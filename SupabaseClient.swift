import Foundation
import Supabase

enum Secrets {
    static var supabaseURL: URL {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path),
           let urlString = dict["SUPABASE_URL"] as? String,
           let url = URL(string: urlString) {
            return url
        }
        return URL(string: "https://qqtwbctzcdfvgdinfvdk.supabase.co")!
    }

    static var supabaseAnonKey: String {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path),
           let key = dict["SUPABASE_ANON_KEY"] as? String {
            return key
        }
        return "sb_publishable_cDffwB9Ht6xPffvodzexfw_UzD2DGeh"
    }
}

/// Globální instance Supabase klienta pro celou aplikaci
let supabase = SupabaseClient(
    supabaseURL: Secrets.supabaseURL,
    supabaseKey: Secrets.supabaseAnonKey
)