// Copyright 1999-2021. Plesk International GmbH. All rights reserved.

const entries = {
    'app/editlist': () => import('../app/editlist'),
    'app/rating': () => import('../app/rating'),
    'app/aha': () => import('../app/aha'),
    'app/app-image/gallery': () => import('../app/app-image/gallery'),
    'app/asp-dot-net/conn_strings-dynamic': () => import('../app/asp-dot-net/conn_strings-dynamic'),
    'app/asp-dot-net/custom_errors-dynamic': () => import('../app/asp-dot-net/custom_errors-dynamic'),
    'app/backup/list': () => import('../app/backup/list'),
    'app/backup/restore': () => import('../app/backup/restore'),
    'app/backup/upload-files': () => import('../app/backup/upload-files'),
    'app/backup/web-content-dynamic': () => import('../app/backup/web-content-dynamic'),
    'app/cloud-backup-restriction': () => import('../app/cloud-backup-restriction'),
    'app/database': () => import('../app/database'),
    'app/domain/tech-domain-name': () => import('../app/domain/tech-domain-name'),
    'app/dns-helper': () => import('../app/dns-helper'),
    'app/dns-zone/soa-record-rname': () => import('../app/dns-zone/soa-record-rname'),
    'app/email-address/aliases-dynamic': () => import('../app/email-address/aliases-dynamic'),
    'app/email-address/configure-client': () => import('../app/email-address/configure-client'),
    'app/email-address/form-ajax': () => import('../app/email-address/form-ajax'),
    'app/email-address/postbox': () => import('../app/email-address/postbox'),
    'app/email-address/responder-attachments-dynamic': () => import('../app/email-address/responder-attachments-dynamic'),
    'app/file-manager/explorer': () => import('../app/file-manager/explorer'),
    'app/file-manager/upload-progress-dialog': () => import('../app/file-manager/upload-progress-dialog'),
    'app/file-manager/file-name-popup-form': () => import('../app/file-manager/file-name-popup-form'),
    'app/hosting-settings/conflicts-checker': () => import('../app/hosting-settings/conflicts-checker'),
    'app/log-browser/browser': () => import('../app/log-browser/browser'),
    'app/log-browser/files': () => import('../app/log-browser/files'),
    'app/login/recovery-password': () => import('../app/login/recovery-password'),
    'app/mail-settings-popup-manager': () => import('../app/mail-settings-popup-manager'),
    'app/newsletter-subscription': () => import('../app/newsletter-subscription'),
    'app/progress-dialog': () => import('../app/progress-dialog'),
    'app/profile/announcement-settings': () => import('../app/profile/announcement-settings'),
    'app/pum': () => import('../app/pum'),
    'app/server/actionlog': () => import('../app/server/actionlog'),
    'app/server/key-info': () => import('../app/server/key-info'),
    'app/server/key-revert': () => import('../app/server/key-revert'),
    'app/server/key-update': () => import('../app/server/key-update'),
    'app/server/key-upload': () => import('../app/server/key-upload'),
    'app/server/logo': () => import('../app/server/logo'),
    'app/server/mail': () => import('../app/server/mail'),
    'app/server/notifications': () => import('../app/server/notifications'),
    'app/show-output-popup': () => import('../app/show-output-popup'),
    'app/task-progress-bar': () => import('../app/task-progress-bar'),
    'app/user/login-string': () => import('../app/user/login-string'),
    'app/change-customers-owner': () => import('../app/change-customers-owner'),
    'app/convert-customers-to-resellers': () => import('../app/convert-customers-to-resellers'),
    'app/convert-resellers-to-customers': () => import('../app/convert-resellers-to-customers'),
    'app/rss-feed-custom-spot': () => import('../app/rss-feed-custom-spot'),
    'app/webspace-selector': () => import('../app/webspace-selector'),
    'app/upgrade-available': () => import('../app/upgrade-available'),
    'views/admin/app/info': () => import('../views/admin/app/info'),
    'views/admin/app/usage': () => import('../views/admin/app/usage'),
    'views/admin/ftp-sessions/list': () => import('../views/admin/ftp-sessions/list'),
    'views/admin/notifications/panel-notifications-settings': () => import('../views/admin/notifications/panel-notifications-settings'),
    'views/admin/partials/subscriptions': () => import('../views/admin/partials/subscriptions'),
    'views/admin/php-handler/list': () => import('../views/admin/php-handler/list'),
    'views/admin/reseller/list': () => import('../views/admin/reseller/list'),
    'views/admin/settings-ui/list-languages': () => import('../views/admin/settings-ui/list-languages'),
    'views/default/app/uploaded': () => import('../views/default/app/uploaded'),
    'views/default/custom-buttons/list': () => import('../views/default/custom-buttons/list'),
    'views/default/scheduler/list': () => import('../views/default/scheduler/list'),
    'views/default/ssl-certificate/list': () => import('../views/default/ssl-certificate/list'),
    'views/smb/app/progress': () => import('../views/smb/app/progress'),
    'views/smb/app/installed': () => import('../views/smb/app/installed'),
    'views/smb/app/apscatalog': () => import('../views/smb/app/apscatalog'),
    'views/smb/dns-zone/records-list': () => import('../views/smb/dns-zone/records-list'),
    'views/smb/email-address/list': () => import('../views/smb/email-address/list'),
    'views/smb/file-manager/list': () => import('../views/smb/file-manager/list'),
    'views/smb/my-service': () => import('../views/smb/my-service'),
};

export default (path, callback) => {
    if (!entries[path]) {
        throw new Error(`Unknown required module ${path}.`);
    }

    entries[path]()
        .then(module => callback && callback(module.default))
        .catch(error => {
            // eslint-disable-next-line no-console
            console.error(error);
        });
};
