package ${packageName};

import com.yourpackage.base.MvpPresenter;
import com.yourpackage.presentation.base.MvpView;

public interface ${className}Contract{
	
	interface View extends MvpView {

	}

	interface Presenter extends MvpPresenter<View> {

	}
}