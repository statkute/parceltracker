//
//  OptionalView.swift
//  Parceltracker
//
//  Created by Harry Levick on 28/06/2020.
//
import SwiftUI

// Helper view to work with optional variables/views.
// USAGE:
// OptionalView(<OPTIONAL VARIABLE>) { 
//     <OPTIONAL VIEW>
// }

struct OptionalView<Value, Content>: View where Content: View {
    var content: (Value) -> Content
    var value: Value
    
    init?(_ value: Value?, @ViewBuilder content: @escaping (Value) -> Content) {
        guard let value = value else {
            return nil
        }
        self.value = value
        self.content = content
    }
    
    var body: some View {
        content(value)
    }
}

extension Optional where Wrapped: View {
    func fallbackView<T: View>(_ transform: () -> T) -> AnyView? {
        switch self {
            case .none:
                return AnyView(transform())
            case .some(let view):
                return AnyView(view)
        }
    }
    
    func fallbackView<T: View, Value>(_ value: Value?, _ transform: (Value) -> T) -> AnyView? {
        switch self {
            case .none:
                if let unwrapped = value {
                    return AnyView(transform(unwrapped))
                } else {
                    return nil
            }
            case .some(let view):
                return AnyView(view)
        }
    }
}
