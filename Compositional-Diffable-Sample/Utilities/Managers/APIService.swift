//
//  APIService.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 15.09.2023.
//

import Alamofire

final class APIService {
    
    private var session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func fetchProducts(page: String?, completion: @escaping (Result<Products, Error>) -> Void) {
        guard let page = page else { return }
        let endpoint = "\(AppSettings.baseAPIURL)products/\(String(describing: page ))"
        
        session.request(endpoint).responseDecodable(of: Products.self) { response in
            switch response.result {
            case .success(let homeData):
                completion(.success(homeData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchProduct(productId: Int, completion: @escaping (Result<Product, Error>) -> Void) {
        let endpoint =  "\(AppSettings.baseAPIURL)products/\(productId)"
        
        session.request(endpoint).responseDecodable(of: Product.self) { response in
            switch response.result {
            case .success(let product):
                completion(.success(product))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
