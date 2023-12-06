@Entry
@Component
struct HomePage {
  @State message: string = 'Hello World'
  @State menuShowed: Boolean = false
  build() {
    Row() {
      if (this.menuShowed) {
        MenuPage().width("30%")
      }
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width(this.menuShowed ? "70%" : '100%')
    }
    .height('100%')
  }
}

@Component
struct  MenuPage {
  build(){

  }
}