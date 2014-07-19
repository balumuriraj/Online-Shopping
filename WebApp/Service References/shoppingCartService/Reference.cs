﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34014
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApp.shoppingCartService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Product", Namespace="http://schemas.datacontract.org/2004/07/ShoppingServices_A3")]
    [System.SerializableAttribute()]
    public partial class Product : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private double PriceField;
        
        private string ProductNameField;
        
        private int QuantityField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public double Price {
            get {
                return this.PriceField;
            }
            set {
                if ((this.PriceField.Equals(value) != true)) {
                    this.PriceField = value;
                    this.RaisePropertyChanged("Price");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string ProductName {
            get {
                return this.ProductNameField;
            }
            set {
                if ((object.ReferenceEquals(this.ProductNameField, value) != true)) {
                    this.ProductNameField = value;
                    this.RaisePropertyChanged("ProductName");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int Quantity {
            get {
                return this.QuantityField;
            }
            set {
                if ((this.QuantityField.Equals(value) != true)) {
                    this.QuantityField = value;
                    this.RaisePropertyChanged("Quantity");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="shoppingCartService.ICartService")]
    public interface ICartService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICartService/addToCart", ReplyAction="http://tempuri.org/ICartService/addToCartResponse")]
        WebApp.shoppingCartService.Product[] addToCart(string userId, string productId, int quantity);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICartService/addToCart", ReplyAction="http://tempuri.org/ICartService/addToCartResponse")]
        System.Threading.Tasks.Task<WebApp.shoppingCartService.Product[]> addToCartAsync(string userId, string productId, int quantity);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICartService/getProductsInCart", ReplyAction="http://tempuri.org/ICartService/getProductsInCartResponse")]
        WebApp.shoppingCartService.Product[] getProductsInCart(string userId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICartService/getProductsInCart", ReplyAction="http://tempuri.org/ICartService/getProductsInCartResponse")]
        System.Threading.Tasks.Task<WebApp.shoppingCartService.Product[]> getProductsInCartAsync(string userId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICartService/removeFromCart", ReplyAction="http://tempuri.org/ICartService/removeFromCartResponse")]
        WebApp.shoppingCartService.Product[] removeFromCart(string userId, string productId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICartService/removeFromCart", ReplyAction="http://tempuri.org/ICartService/removeFromCartResponse")]
        System.Threading.Tasks.Task<WebApp.shoppingCartService.Product[]> removeFromCartAsync(string userId, string productId);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ICartServiceChannel : WebApp.shoppingCartService.ICartService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class CartServiceClient : System.ServiceModel.ClientBase<WebApp.shoppingCartService.ICartService>, WebApp.shoppingCartService.ICartService {
        
        public CartServiceClient() {
        }
        
        public CartServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public CartServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CartServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CartServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public WebApp.shoppingCartService.Product[] addToCart(string userId, string productId, int quantity) {
            return base.Channel.addToCart(userId, productId, quantity);
        }
        
        public System.Threading.Tasks.Task<WebApp.shoppingCartService.Product[]> addToCartAsync(string userId, string productId, int quantity) {
            return base.Channel.addToCartAsync(userId, productId, quantity);
        }
        
        public WebApp.shoppingCartService.Product[] getProductsInCart(string userId) {
            return base.Channel.getProductsInCart(userId);
        }
        
        public System.Threading.Tasks.Task<WebApp.shoppingCartService.Product[]> getProductsInCartAsync(string userId) {
            return base.Channel.getProductsInCartAsync(userId);
        }
        
        public WebApp.shoppingCartService.Product[] removeFromCart(string userId, string productId) {
            return base.Channel.removeFromCart(userId, productId);
        }
        
        public System.Threading.Tasks.Task<WebApp.shoppingCartService.Product[]> removeFromCartAsync(string userId, string productId) {
            return base.Channel.removeFromCartAsync(userId, productId);
        }
    }
}
