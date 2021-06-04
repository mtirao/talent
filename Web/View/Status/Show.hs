module Web.View.Status.Show where
import Web.View.Prelude

data ShowView = ShowView { status :: Status }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={StatusesAction}>Statuses</a></li>
                <li class="breadcrumb-item active">Show Status</li>
            </ol>
        </nav>
        <h1>Show Status</h1>
        <p>{status}</p>
    |]
