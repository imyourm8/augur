import { connect } from 'react-redux';

import NotificationsView from 'modules/notifications/components/notifications-view';
import selectNotifications from 'modules/notifications/selectors/notifications';
import { removeNotification, clearNotifications } from 'modules/notifications/actions/update-notifications';
import { updateURL } from 'modules/link/actions/update-url';

const mapStateToProps = state => ({
  notifications: selectNotifications()
});

const mapDispatchToProps = dispatch => ({
  onClick: href => dispatch(updateURL(href)),
  removeNotification: index => dispatch(removeNotification(index)),
  clearNotifications: () => dispatch(clearNotifications())
});

const NotificationsContainer = connect(mapStateToProps, mapDispatchToProps)(NotificationsView);

export default NotificationsContainer;
