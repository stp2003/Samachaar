import 'package:samachaar/model/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> sliders = [];
  SliderModel sliderModel = SliderModel();

  sliderModel.name = "Business";
  sliderModel.image = "assets/business.jpg";
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "Entertainment";
  sliderModel.image = "assets/entertainment.jpg";
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "General";
  sliderModel.image = "assets/general.jpg";
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "Health";
  sliderModel.image = "assets/health.jpg";
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "Sports";
  sliderModel.image = "assets/sport.jpg";
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  return sliders;
}
