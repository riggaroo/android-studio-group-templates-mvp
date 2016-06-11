<?xml version="1.0"?>
<recipe>

	<instantiate from="src/app_package/Contract.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}Contract.java" />
	<instantiate from="src/app_package/MvpView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}Activity.java" />
	<instantiate from="src/app_package/Presenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}Presenter.java" />


	<open file="${srcOut}/${className}Presenter.java"/>
</recipe>