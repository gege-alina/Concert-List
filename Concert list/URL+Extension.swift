//
//  URLRequest+Extension.swift
//  Concert list
//
//  Created by georgiana.stefan
//

import Foundation
import RxSwift

extension URL {
    public func downloadImage() -> Observable<UIImage?> {
        let request = URLRequest(url: self)
        return URLSession.shared.rx.data(request: request)
            .map { data -> UIImage? in
                UIImage(data: data)
            }
            .flatMap {
                Observable.from(optional: $0)
            }
    }
}
