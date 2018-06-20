## android-studio-group-templates-mvp
Example of template for Android Studio, to create a set of files for MVP functionality.

**Please read the blog post first** as this is just an example implementation of the concepts described in the blog post:
https://riggaroo.co.za/custom-file-template-group-android-studiointellij/ 


# Important Note: This is just an example usage of file templates, I am not advocating this is the perfect solution for using MVP in Android. This sample is merely to show how you can create a set of files based on a template of files. 

In order to use this in your project. 

* Create the following files in your project:

**MvpView.java**
  ```
  public interface MvpView {
  }
  ```
**MvpPresenter.java**

  ```
  public interface MvpPresenter<V extends MvpView> {

      void attachView(V mvpView);

      void detachView();
  }
  ```
**BasePresenter.java**
```
  /**
   * Base class that implements the Presenter interface and provides a base implementation for
   * attachView() and detachView(). It also handles keeping a reference to the mvpView that
   * can be accessed from the children classes by calling getView().
   */
  public class BasePresenter<T extends MvpView> implements MvpPresenter<T> {
  
      private T view;
  
      private CompositeSubscription compositeSubscription = new CompositeSubscription();
  
      @Override
      public void attachView(T mvpView) {
          view = mvpView;
      }
  
      @Override
      public void detachView() {
          view = null;
          compositeSubscription.clear();
      }
  
      public T getView() {
          return view;
      }
  
      public void checkViewAttached() {
          if (!isViewAttached()) {
              throw new MvpViewNotAttachedException();
          }
      }
  
      public boolean isViewAttached() {
          return view != null;
      }
  
      public void addSubscription(Subscription subscription) {
          this.compositeSubscription.add(subscription);
      }
  
      public static class MvpViewNotAttachedException extends RuntimeException {
          public MvpViewNotAttachedException() {
              super("Please call Presenter.attachView(MvpView) before" + " requesting data to the Presenter");
          }
      }
  }
```

* You will need to change the package name of the import statement  in the template files, as when you generate this template it will generate different import statements. You need to change it in the following places:
  * root/src/app_package/Contract.java.ftl, 
  * root/src/app_package/MvpView.java.ftl
  * root/src/pp_package/Presenter.java.ftl 
 
  Change the import statements in each of those files, to correspond with your package name.

* Then place the folder from this project into your '.android/' of your system:
```
~/.android/templates/other/
```

* Restart Android Studio, and then when you right click on a folder to create a new file, you will be able to see the new option to create a MVP Function.
