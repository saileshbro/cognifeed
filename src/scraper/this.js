class RandomClass {
  getPrivate() {
    return {
      private: { reallyPrivate: this._private }
    }
  }

  reallyGetPrivate() {
    return this._private
  }

  constructor() {
    this._private = "private"
  }
}

let random = new RandomClass()
console.log(random.getPrivate().private)
console.log(random.reallyGetPrivate())
