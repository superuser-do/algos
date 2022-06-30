import Foundation

func cons<L, R>(_ l: L, _ r: R) -> (() -> (L, R)) {
    return { () -> (L, R) in
        return (l, r)
    }
}

func car<L, R>(_ f: () -> (L, R)) -> L {
    let (l, _) = f()
    return l
}

func cdr<L, R>(_ f: () -> (L, R)) -> R {
    let (_, r) = f()
    return r
}

car(cons(3, 4))
cdr(cons(3, 4))
