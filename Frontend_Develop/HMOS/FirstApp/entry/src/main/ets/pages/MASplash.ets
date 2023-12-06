import router from '@ohos.router'
@Entry
@Component
struct MASplash {
  private  swiperController: SwiperController = new SwiperController();
  private  splashNames = ["well come !","splash 1","splash 2","splash 3","splash 4","splash 5"];
  @State countTime: number = 5;
  private  timerID: number = -1;
  @State autoPlay: boolean = false


  timerFired(){
    this.timerID = setInterval(()=>{
      clearInterval(this.timerID)
      console.log("autoPlay " + `${this.countTime}` +` timerID: ${this.timerID}`)
      this.autoPlay = true
      this.timerID = setInterval(() => {
        console.log("repeateBlock " + `${this.countTime}` +` timerID: ${this.timerID}`)
        this.countTime = Number(this.countTime - 1);
        if (this.countTime == Number(0)){
          this.jumpToMainPage();
        }
      },1000)
    },3000)
  }

  timerClean(){
    if(this.timerID != -1){
      clearInterval(this.timerID)
      this.timerID = -1;
    }

  }
  aboutToAppear(){
    this.timerFired()
  }

  aboutToDisappear(){
    this.timerClean()
  }

  jumpToMainPage():void {
    this.timerClean()
    router.replaceUrl({url:"pages/HomePage"})
  }

  build() {
    Column() {
      Stack(){
        Swiper(this.swiperController){
          ForEach(this.splashNames,(item: string,index: number) => {
            Column(){
              Text(this.splashNames[index])
                .width("100%")
                .height("100%")
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Brown)
                .fontSize(35)
                .backgroundColor(Color.Pink)

              if (index == Number(this.splashNames.length - 1)){
                Button("Go Next").onClick(()=>{
                  this.jumpToMainPage()
                }).width(100).height(40).backgroundColor(Color.Orange).position({x:"40%",y:"55%"})
              }
            }

          })
        }.loop(true)
        .interval(2000 )
        .duration(1000)
        .autoPlay(this.autoPlay ? true : false)
        .indicatorStyle({
          bottom: 100,
          color: Color.Orange
        })
        if (this.autoPlay) {
          Text(){
            Span("跳过")
            Span(`${this.countTime}`)
          }
          .fontSize(15)
          .fontColor(Color.White)
          .width(60)
          .height(40)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Gray)
          .borderRadius(20)
          .position({x: "80%",y: 35})
          .onClick(()=>{
            this.jumpToMainPage()
          })
        }
      }
    }.width("100%").height("100%").backgroundColor(Color.Gray)
  }
}