import QtQuick 1.1
import com.nokia.symbian 1.1
import QtWebKit 1.0

MyPage {
    id: page;

    property bool firstStart: true;
    function initialize(){
        if (firstStart){
            firstStart = false;
            getlist();
        }
    }

    function getlist(){
        var mobileUrl = "http://bgm.tv/m";
        if (webView.url == mobileUrl){
            webView.reload.trigger();
        } else {
            webView.url = mobileUrl;
        }
    }

    title: "超展开";

    FlickableWebView {
        id: webView;
        anchors.fill: parent;
    }

    ScrollDecorator {
        flickableItem: webView;
    }

    ProgressBar {
        id: proBar;
        anchors {
            left: parent.left; right: parent.right;
            bottom: parent.bottom;
        }
        opacity: 0.6;
        visible: webView.loading;
        value: webView.progress;
    }
}
